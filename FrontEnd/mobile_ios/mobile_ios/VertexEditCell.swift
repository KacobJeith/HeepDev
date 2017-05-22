import UIKit
import RealmSwift

class VertexEditCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let realm = try! Realm()
    var collectionView: UICollectionView!
    var devices: [Device] = []
    var controls = List<DeviceControl>()
    var controlDeviceReference: [Device] = []
    var thisBSSID: String = ""
    var parentTable = UITableView()
    var editImage: UIImage = UIImage()
    var controlIDs = [Int]()
    var myIndexPath = IndexPath()
    var thisGroup = Group()
    var contextImage = UIImage()
    var controlTags = [Int]()
    var notificationToken: NotificationToken? = nil
    
    convenience init(bssid: String,
                     parentTable: UITableView,
                     thisGroup: Group,
                     indexPath: IndexPath) {
        self.init()
        
        self.thisBSSID = bssid
        self.parentTable = parentTable
        self.controls = thisGroup.controls
        self.myIndexPath = indexPath
        self.thisGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)!
        
        
        notificationToken = thisGroup.addNotificationBlock { changes in
            /* results available asynchronously here */
            switch changes {
            case .change:
                print("Active Change")
                parentTable.reloadData()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default:
                print("Active Default")
            }
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let tryImage = getContextImage()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        if tryImage == nil {
            
            layout.itemSize = CGSize(width: screenWidth, height: 420)
            
        } else {
            
            let naturalWidth = tryImage?.size.width
            let naturalHeight = tryImage?.size.height
            
            let aspectRatio = naturalWidth! / naturalHeight!
            
            layout.itemSize = CGSize(width: 420 * aspectRatio, height: 420)
        }
        
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,
                                                        width: screenWidth,
                                                        height: 420) ,
                                          collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.contentOffset.x = thisGroup.contentOffsetX
        collectionView.contentOffset.y = thisGroup.contentOffsetY
        
        self.addSubview(collectionView)
    }
    
    deinit{
        notificationToken?.stop()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as UICollectionViewCell
        
        
        let imageView = setContextImage(cell: cell, indexPath: indexPath)
        cell.addSubview(imageView)
        cell.isUserInteractionEnabled = true
        cell.tag = 1
        
        
        for eachControl in controls {
            
            for eachVertex in eachControl.vertexList {
                
                let vertexLayer = drawVertex(vertex: eachVertex)
                print("Adding Vertex \(String(describing: eachVertex.rx?.controlName))")
                cell.layer.addSublayer(vertexLayer)
            }
            
            
            let controlSprite = addControlSprite(cell: cell, thisControl: eachControl)
            controlSprite.layer.borderWidth = 1
            controlSprite.layer.borderColor = eachControl.uniqueID == thisGroup.selectedControl ? UIColor.blue.cgColor : UIColor.white.cgColor
            controlSprite.tag = eachControl.uniqueID
            
            cell.addSubview(controlSprite)
            
            
        }
        
        if self.thisGroup.selectedControl != 0 {
            self.collectionView.isScrollEnabled =  false
            let pan = UIPanGestureRecognizer(target: self,
                                             action: #selector(handlePan))
            let pinch = UIPinchGestureRecognizer(target: self,
                                                 action: #selector(handlePinch))
            let rotate = UIRotationGestureRecognizer(target: self,
                                                     action: #selector(handleRotation))
            pinch.delegate = self
            rotate.delegate = self
            pan.delegate = self
            cell.addGestureRecognizer(pan)
            cell.addGestureRecognizer(pinch)
            cell.addGestureRecognizer(rotate)

        } else {
            
            self.collectionView.isScrollEnabled =  true
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{

        let naturalWidth = contextImage.size.width
        let naturalHeight = contextImage.size.height
        
        let aspectRatio = naturalWidth / naturalHeight
        
        return CGSize(width: aspectRatio * 440, height: 440)
    }
    
    
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: self)
        let myView = self.viewWithTag(thisGroup.selectedControl)!
        myView.center.x += translation.x
        myView.center.y += translation.y
        
        let cellView = self.viewWithTag(1)!
        
        for sublayer in cellView.layer.sublayers! {
           
            if sublayer.name != nil {
                if sublayer.name!.range(of: String(thisGroup.selectedControl)) != nil {
                    sublayer.removeFromSuperlayer()
                }
            }
            
        }
        
        
        let realm = try! Realm()
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl)
        
        for eachControl in thisGroup.controls {
            for eachVertex in eachControl.vertexList {
                
                let index = eachVertex.vertexID.range(of: String(describing: (thisControl?.uniqueID)!))
                if  index != nil {
                    let calculatedIndex = eachVertex.vertexID.distance(from: eachVertex.vertexID.startIndex, to: (index?.lowerBound)!)
                    
                    var start = CGPoint(x: myView.center.x,
                                        y: myView.center.y)
                    var finish = CGPoint(x: (eachVertex.rx?.editX)!,
                                         y: (eachVertex.rx?.editY)!)
                    
                    if calculatedIndex != 0 {
                        
                        start = CGPoint(x: (eachVertex.tx?.editX)!,
                                        y: (eachVertex.tx?.editY)!)
                        finish = CGPoint(x: myView.center.x,
                                         y: myView.center.y)
                    }
                    
                    let newPath = drawVertex(start: start,
                                             finish: finish)
                    newPath.name = eachVertex.vertexID
                    cellView.layer.addSublayer(newPath)
                }
            }
        }
        
        
        gestureRecognizer.setTranslation(CGPoint(), in: self)
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            saveSelectedSprite()
        }
    }
    
    
    func handlePinch(gestureRecognizer: UIPinchGestureRecognizer) {
        let myView = self.viewWithTag(thisGroup.selectedControl)!
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl)!
        myView.transform = CGAffineTransform(scaleX: thisControl.scale * gestureRecognizer.scale,
                                             y: thisControl.scale * gestureRecognizer.scale).rotated(by: CGFloat(atan2f(Float(CGFloat(myView.transform.b)),Float(myView.transform.a))))

        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            saveSelectedSprite()
        }
    }
    
    func handleRotation(gestureRecognizer: UIRotationGestureRecognizer) {
        let myView = self.viewWithTag(thisGroup.selectedControl)!
        
        myView.transform = myView.transform.rotated(by: gestureRecognizer.rotation * 3)
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            saveSelectedSprite()
        }
        
        gestureRecognizer.rotation = 0
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("End scrollView Deceleration")
        let realm = try! Realm()
        
        try! realm.write {
            thisGroup.contentOffsetX = collectionView.contentOffset.x
            thisGroup.contentOffsetY = collectionView.contentOffset.y
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            print("End scrollView Dragging")
            let realm = try! Realm()
            
            try! realm.write {
                thisGroup.contentOffsetX = collectionView.contentOffset.x
                thisGroup.contentOffsetY = collectionView.contentOffset.y
            }
        }
        
    }
    
}

extension VertexEditCell {
    
    func drawVertex(vertex: Vertex) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let curve = UIBezierPath()
        let startPoint = CGPoint(x: (vertex.tx?.editX)!, y: (vertex.tx?.editY)!)
        let finishPoint = CGPoint(x: (vertex.rx?.editX)!, y: (vertex.rx?.editY)!)
        
        curve.move(to: startPoint)
        curve.addQuadCurve(to: finishPoint, controlPoint: CGPoint(x: (vertex.tx?.editX)!, y: (vertex.rx?.editY)!))
        shapeLayer.path = curve.cgPath
        
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.name = vertex.vertexID
        
        return shapeLayer
    }
    
    func drawVertex(start: CGPoint, finish: CGPoint) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let curve = UIBezierPath()
        
        curve.move(to: start)
        curve.addQuadCurve(to: finish, controlPoint: CGPoint(x: start.x, y: finish.y))
        shapeLayer.path = curve.cgPath
        
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.0
        
        return shapeLayer
    }
    
    func setContextImage(cell: UICollectionViewCell, indexPath: IndexPath) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
        imageView.image = UIImage(data: thisGroup.imageData as Data)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = indexPath.row
        return imageView
    }
    
    func getContextImage() -> UIImage? {
        
        return UIImage(data: thisGroup.imageData as Data)
    }
    
    func addControlSprite(cell: UICollectionViewCell, thisControl: DeviceControl) -> UIButton {
        controlIDs.append(thisControl.uniqueID)
        
        let iconName = SuggestIconFromName(name: thisControl.controlName)
        let image = UIImage(named: iconName) as UIImage?
        let controlSprite = UIButton()
        
        controlSprite.setBackgroundImage(image, for: [])
        controlSprite.contentMode = .scaleAspectFit
        controlSprite.frame = CGRect(x: thisControl.editX - 30,
                                     y: thisControl.editY - 30,
                                     width: 60,
                                     height: 60)
        
        controlSprite.transform = CGAffineTransform(scaleX: thisControl.scale, y: thisControl.scale).rotated(by: thisControl.rotation)
        controlSprite.clipsToBounds = true
        controlSprite.tag = controlIDs.count - 1
        
        
        return controlSprite
    }
    
    func saveSelectedSprite() {
        let realm = try! Realm(configuration: config)
        
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl)!
        let myView = self.viewWithTag(thisGroup.selectedControl)!
        
        let rotation = CGFloat(atan2f(Float(CGFloat(myView.transform.b)),Float(myView.transform.a)))
        let scale = sqrt(pow(myView.transform.a,2) + pow(myView.transform.b, 2))
        let editX = myView.frame.origin.x + myView.frame.width/2
        let editY = myView.frame.origin.y + myView.frame.height/2
        
        try! realm.write {
            
            thisControl.rotation = rotation
            thisControl.scale = scale
            thisControl.editX = editX
            thisControl.editY = editY
        }
        
    }
    
}

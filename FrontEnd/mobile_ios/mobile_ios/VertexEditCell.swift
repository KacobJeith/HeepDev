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
    var controlIDs = [String]()
    var myIndexPath = IndexPath()
    var thisGroup = Group()
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
                //parentTable.reloadRows(at: [self.myIndexPath], with: UITableViewRowAnimation.none)
                parentTable.reloadData()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default:
                print("Active Default")
            }
        }
    }
    
    deinit{
        notificationToken?.stop()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        layout.itemSize = CGSize(width: screenWidth, height: 440)
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,
                                                        width: screenWidth,
                                                        height: 440) ,
                                          collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        
        self.addSubview(collectionView)
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
        for eachControl in controls {
            
            let controlSprite = addControlSprite(cell: cell, thisControl: eachControl)
            controlSprite.layer.borderWidth = 1
            controlSprite.layer.borderColor = eachControl.uniqueID == thisGroup.selectedControl ? UIColor.blue.cgColor : UIColor.white.cgColor
            cell.addSubview(controlSprite)
        }
        
        
        return cell
    }
    
}

extension VertexEditCell {
     
    
    func setContextImage(cell: UICollectionViewCell, indexPath: IndexPath) -> UIImageView {
        let imageView = UIImageView(frame: cell.bounds)
        imageView.image = UIImage(data: thisGroup.imageData as Data)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = indexPath.row

        return imageView
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
        controlSprite.clipsToBounds = true
        controlSprite.tag = controlIDs.count - 1
        
        controlSprite.addTarget(self,
                               action: #selector(drag),
                               for: [UIControlEvents.touchDragInside,
                                     UIControlEvents.touchDragOutside,
                                     UIControlEvents.touchDragExit])
        
        
        return controlSprite
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let saveControl = realm.object(ofType: DeviceControl.self,
                                       forPrimaryKey: thisGroup.selectedControl)!
        
        print("began")
        //if let center = event.allTouches?.first?.location(in: self.collectionView) {
            //control.center = center
            //saveDragPosition(center: center,thisControl: controls[(event.allTouches?.first?.view!.tag)!])
        //}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let saveControl = realm.object(ofType: DeviceControl.self,
                                       forPrimaryKey: thisGroup.selectedControl)!
        print("Ended")
        saveDragPosition(center: (touches.first?.location(in: self.collectionView))!,
                         thisControl: saveControl)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        let saveControl = realm.object(ofType: DeviceControl.self,
                                       forPrimaryKey: thisGroup.selectedControl)!
        print("Cancelled")
        saveDragPosition(center: (touches.first?.location(in: self.collectionView))!,
                         thisControl: saveControl)
    }
    
    func drag(control: UIControl, event: UIEvent) {
        
        if let center = event.allTouches?.first?.location(in: self.collectionView) {
            control.center = center
            //saveDragPosition(center: center,thisControl: controls[(event.allTouches?.first?.view!.tag)!])
        }
    }
    
    func saveDragPosition(center: CGPoint, thisControl: DeviceControl) {
        let realm = try! Realm(configuration: config)
        try! realm.write {
            thisControl.editX = center.x
            thisControl.editY = center.y
        }
    }
    
}

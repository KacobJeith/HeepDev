import UIKit
import RealmSwift

class VertexEditCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var parentTable = UITableViewController()
    var collectionView: UICollectionView!
    var controls = List<DeviceControl>()
    
    var cellView = UICollectionViewCell()
    
    var controlIDs = [Int]()
    
    var thisGroup = Group()
    var contextImage = UIImage()
    var controlTags = [Int]()
    
    var longPressActive = false
    var initialLongPressLocation = CGPoint()
    var startSliderRatio = CGFloat()
    var lastSlidingValue = Int()
    
    var activeVertexStart = CGPoint()
    var activeVertexFinish = CGPoint()
    var activeVertex = Vertex()
    
    var lastSendTime = DispatchTime.init(uptimeNanoseconds: 0)
    
    var vertexDictToDelete = [String : Bool]()
    
    convenience init(bssid: String,
                     cellFrame: CGRect,
                     thisGroup: Group,
                     indexPath: IndexPath) {
        self.init()
        
        let realm = try! Realm(configuration: configUser)
        
        self.controls = thisGroup.controls
        self.thisGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)!
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let editSpaceHeight = cellFrame.height
        
        if let tryImage = getContextImage() {
            
            
            
            
            let naturalWidth = tryImage.size.width
            let naturalHeight = tryImage.size.height
            
            let aspectRatio = naturalWidth / naturalHeight
            
            if aspectRatio < 1 {
                
                layout.itemSize = CGSize(width: screenWidth,
                                         height: editSpaceHeight)
            } else {
                
                layout.itemSize = CGSize(width: editSpaceHeight * aspectRatio,
                                         height: editSpaceHeight)
            }
            
        } else {
            
            layout.itemSize = CGSize(width: screenWidth,
                                     height: editSpaceHeight)

        }
        
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,
                                                        width: screenWidth,
                                                        height: editSpaceHeight) ,
                                          collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.contentOffset.x = thisGroup.contentOffsetX
        collectionView.contentOffset.y = thisGroup.contentOffsetY
        
        self.addSubview(collectionView)
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
        
        cellView = cell
        
        cell.isUserInteractionEnabled = true
        cell.tag = 1
        
        setContextImage(imageData: thisGroup.imageData,
                        tag: indexPath.row)
        
        addControlsAndVertices()
        setActiveGestures(cell: cell)
        
        return cell
    }
    
    func setContextImage(imageData: NSData, tag: Int) {
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: cellView.bounds.width,
                                                  height: cellView.bounds.height))
        
        imageView.image = UIImage(data: imageData as Data)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = tag
        cellView.addSubview(imageView)
        
    }
    
    func addControlsAndVertices() {
        
        for eachControl in controls {
            
            for eachVertex in eachControl.vertexList {
                
                cellView.layer.addSublayer(drawVertex(vertex: eachVertex))
            }
            
            cellView.addSubview(addControlSprite(thisControl: eachControl))
            
        }
    }
    
    func setActiveGestures(cell: UICollectionViewCell) {
        
        switch self.thisGroup.selectedControl {
            
        case 0 : // Just Scrolling
            
            self.collectionView.isScrollEnabled = true
            
        case 1 :
            
            addAddingVertexGestures(cell: cell)
            
        case 2 :
            
            addDeletingVertexGestures(cell: cell)
            
        default :
            
            addSelectedControlGestures(cell: cell)
            
        }
        
    }
    
    func addAddingVertexGestures(cell: UICollectionViewCell) {
        self.collectionView.isScrollEnabled =  false
        
        let vertexPan = UIPanGestureRecognizer(target: self,
                                               action: #selector(handleVertexPan))
        
        vertexPan.delegate = self
        cell.addGestureRecognizer(vertexPan)

    }
    
    func addDeletingVertexGestures(cell: UICollectionViewCell) {
        self.collectionView.isScrollEnabled =  false
        resetVertexDictToDelete()
        
        let deleteVertexPan = UIPanGestureRecognizer(target: self,
                                                     action: #selector(handleDeleteVertexPan))
        
        deleteVertexPan.delegate = self
        cell.addGestureRecognizer(deleteVertexPan)
    }
    
    func addSelectedControlGestures(cell: UICollectionViewCell) {
        
        self.collectionView.isScrollEnabled =  false
        
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(handlePan))
        let pinch = UIPinchGestureRecognizer(target: self,
                                             action: #selector(handlePinch))
        let rotate = UIRotationGestureRecognizer(target: self,
                                                 action: #selector(handleRotation))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        pinch.delegate = self
        rotate.delegate = self
        pan.delegate = self
        longPress.delegate = self
        cell.addGestureRecognizer(longPress)
        cell.addGestureRecognizer(pan)
        cell.addGestureRecognizer(pinch)
        cell.addGestureRecognizer(rotate)
        cell.addSubview(addDetailButton())
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
    
}

extension VertexEditCell {
    
    func handleVertexPan(gesture: UIPanGestureRecognizer) {
        let cellView = self.viewWithTag(1)!
        
        searchSublayersForNameToRemove(names: ["circle", "vertex"])
        
        switch gesture.state {
            
        case .began :
            
            activeVertex = Vertex()
            cellView.layer.addSublayer(drawCircle(center: gesture.location(in: cellView),
                                                  radius: 35,
                                                  name: "circle",
                                                  highlight: true))
            
        case .changed :
            
            if activeVertexStart == CGPoint() {
                
                findOutputControl(gesture: gesture)
                
                
            } else {
                
                findInputControl(gesture: gesture)
                
            }
            
        case .ended :
            
            commitAddVertex()
            activeVertexStart = CGPoint()
            activeVertexFinish = CGPoint()
            searchSublayersForNameToRemove(names: ["finish", "start", "vertex"])
            
        default : break
            
            
        }
        
    }
    
    func handleDeleteVertexPan(gesture: UIPanGestureRecognizer) {
        searchSublayersForNameToRemove(names: ["circle"])
        
        cellView.layer.addSublayer(drawCircle(center: gesture.location(in: cellView),
                                              radius: 35,
                                              name: "circle"))
        
        switch gesture.state {
            
        case .began , .changed :
            
            catchVertexCollisions(gesture: gesture)
    
        case .ended :
            
            commitDeleteVertex()
            searchSublayersForNameToRemove(names: ["circle"])
            
        default : break
            
        }
        
    }
    
    func commitDeleteVertex() {
        
        
        let realm = try! Realm(configuration: configUser)
        
        for vertex in vertexDictToDelete {
            if vertex.value == true {
                
                if let thisVertex = realm.object(ofType: Vertex.self, forPrimaryKey: vertex.key) {
                    
                    HeepConnections().sendDeleteVertexToHeepDevice(activeVertex: thisVertex)
                    
                    try! realm.write {
                        realm.delete(thisVertex)
                    }
                    
                } else {
                    print("Could not identify vertex")
                }
                
            }
        }
        
        
    }
    
    func commitAddVertex() {
        
        guard let tx = activeVertex.tx else {
            print("TX not set")
            return
        }
        
        guard let rx = activeVertex.rx else {
            print("RX  not set")
            return
        }
        
        let realm = try! Realm(configuration: configUser)
        
        activeVertex.vertexID = nameVertex(tx: tx, rx: rx)
        
        try! realm.write {
            realm.add(activeVertex, update: true)
            activeVertex.tx?.vertexList.append(activeVertex)
        }
        
        HeepConnections().sendSetVertexToHeepDevice(activeVertex: activeVertex)
        
    }
    
    
    func catchVertexCollisions(gesture: UIPanGestureRecognizer)  {
        
        for sublayer in cellView.layer.sublayers! {
            if let sublayerName = sublayer.name {
                
                for vertexName in vertexDictToDelete.keys {
                    
                    if sublayerName == vertexName && vertexDictToDelete[vertexName] != true {
                        
                        checkVertexPositionAndResolve(gesture: gesture,
                                                      sublayer: sublayer,
                                                      vertexName: vertexName)
                        
                    }
                }
                
            }
        }
    }
    
    func checkVertexPositionAndResolve(gesture: UIPanGestureRecognizer, sublayer: CALayer, vertexName: String) {
        
        let position = gesture.location(in: collectionView)
        
        if let check = sublayer.accessibilityPath?.contains(position) {
            if check == true {
                
                vertexDictToDelete[vertexName] = true
                let realm = try! Realm(configuration: configUser)
                
                let thisVertex = realm.object(ofType: Vertex.self,
                                              forPrimaryKey: vertexName)!
                
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                cellView.layer.addSublayer(drawVertex(vertex: thisVertex,
                                                      highlight: true,
                                                      name: "toDelete"))
                
            }
        }
    }
    
    func findOutputControl(gesture: UIPanGestureRecognizer) {
        
        cellView.layer.addSublayer(drawCircle(center: gesture.location(in: cellView),
                                              radius: 35,
                                              name: "circle"))
        
        verifyControlForVertex(gesture: gesture,
                               direction: 1)

    }
        
    func findInputControl(gesture: UIPanGestureRecognizer) {
        
        cellView.layer.addSublayer(drawVertex(start: activeVertexStart,
                                              finish: gesture.location(in: cellView),
                                              name: "vertex",
                                              highlight: true))
        
        verifyControlForVertex(gesture: gesture,
                               direction: 0,
                               replace: activeVertexFinish == CGPoint() ? false : true )
    
    }
    
    func verifyControlForVertex(gesture: UIPanGestureRecognizer, direction: Int, replace: Bool = false) {
        
        if let touched = touchingControlSprite(gesture: gesture) {
            
            if direction == 0 {
                
                if touched.controlDirection == direction {
                    
                    let newActiveVertexFinish = CGPoint(x: touched.editX,
                                                        y: touched.editY)
                    
                    if newActiveVertexFinish != activeVertexFinish {
                        activeVertexFinish = CGPoint(x: touched.editX,
                                                     y: touched.editY)
                        
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        
                        activeVertex.rx = touched
                        
                        if replace {
                            searchSublayersForNameToRemove(names: ["finish"])
                        }
                        
                        cellView.layer.addSublayer(drawCircle(center: activeVertexFinish,
                                                              radius: 35,
                                                              name: "finish",
                                                              highlight: true))
                    }
                    
                }
                
            } else if direction == 1 {
                
                if touched.controlDirection == direction {
                    activeVertexStart = CGPoint(x: touched.editX,
                                                y: touched.editY)
                    activeVertex.tx = touched
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                    
                    cellView.layer.addSublayer(drawCircle(center: activeVertexStart,
                                                          radius: 35,
                                                          name: "start",
                                                          highlight: true))
                    
                }
            }
            
        }
        
    }
    
    func searchSublayersForNameToRemove(names: [String]) {
        
        for sublayer in cellView.layer.sublayers! {
            if sublayer.name != nil {
                for name in names {
                    removeSublayerWithName(sublayer: sublayer, name: name)
                }
                
            }
        }
    }
    
    func removeSublayerWithName(sublayer: CALayer, name: String) {
        if sublayer.name!.range(of: name) != nil {
            sublayer.removeFromSuperlayer()
        }
    }
    
    func drawCircle(center: CGPoint, radius: CGFloat, name: String, highlight: Bool = false) -> CAShapeLayer {
        
        let circlePath = UIBezierPath(arcCenter: center,
                                      radius: radius,
                                      startAngle: CGFloat(0),
                                      endAngle:CGFloat(Double.pi * 2),
                                      clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = getModeColor(thisGroup: thisGroup, highlight: highlight).cgColor
        shapeLayer.strokeColor = getModeColor(thisGroup: thisGroup, highlight: highlight).cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.opacity = 0.4
        shapeLayer.name = name
        
        return shapeLayer
    }
    
    func touchingControlSprite(gesture: UIPanGestureRecognizer) -> DeviceControl? {
        
        for control in thisGroup.controls {
            
            let position = gesture.location(in: collectionView)
            let check = self.viewWithTag(control.uniqueID)!.frame.contains(position)
            if check {
                return control
            }
        }
        
        return nil
    }

    
}

// Manipulating ControlSprite Position (thisGroup.selectedControl > 1)

extension VertexEditCell {
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer){
        if longPressActive{
//            print("adjusting range")
        }
        else{
            translateSpritePosition(gestureRecognizer: gestureRecognizer)
        }
    }
    
    func translateSpritePosition(gestureRecognizer: UIPanGestureRecognizer) {
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
        
        
        let realm = try! Realm(configuration: configUser)
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
            print("End")
            saveSelectedSprite()
        }
    }
    
    
    func handlePinch(gestureRecognizer: UIPinchGestureRecognizer) {
        let realm = try! Realm(configuration: configUser)
        
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
        
        myView.subviews[0].transform = myView.subviews[0].transform.rotated(by: -gestureRecognizer.rotation * 3)
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            saveSelectedSprite()
        }
        
        gestureRecognizer.rotation = 0
    }
    
    func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        var ratio = CGFloat(0.5)
        
        let realm = try! Realm(configuration: configUser)
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl)!
        
        if longPressActive == true{
            let myView = self.viewWithTag(thisGroup.selectedControl)!
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            
            let maxFingerRange = CGFloat(200.0)
            
            let startingRatioOffset = ( maxFingerRange * startSliderRatio ) - CGFloat( maxFingerRange/2.0 )
            
            var offset = (initialLongPressLocation.y - location.y) + CGFloat(maxFingerRange/2.0) + startingRatioOffset
            
            if offset > maxFingerRange{
                offset = maxFingerRange
            }
            else if offset < 0{
                offset = 0
            }
            
            ratio = offset / maxFingerRange
            
            let yTransform = 60 * (1.0-ratio)
        
            myView.subviews[0].subviews[0].frame = CGRect(x: 0, y: yTransform, width: 60, height: 60)
            
            let controlUniqueID = thisControl.uniqueID
            
            let slidingValue = Int( ratio * CGFloat(thisControl.valueHigh - thisControl.valueLow) )
            
            
            //timeSince returns false if duration is less than timeInterval specified
            if ( SuccessROPReceived || !lessThanTimeInterval(start: lastSendTime, end: DispatchTime.now(), timeInterval: 10_000_000) ) && slidingValue != lastSlidingValue {
                
                DispatchQueue.global().async(){
                    HeepConnections().sendValueToHeepDevice(uniqueID: controlUniqueID,
                                                            currentValue: slidingValue )
                }
                SuccessROPReceived = false
                lastSlidingValue = slidingValue
                lastSendTime = DispatchTime.now()
            }
            
        }
    
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            
            longPressActive = true
            
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
            startSliderRatio = 1.0 - getControlValueRatio(control: thisControl)
            initialLongPressLocation = gestureRecognizer.location(in: gestureRecognizer.view)

            print("BEGIN LONG PRESS!")
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.ended {
            let controlUniqueID = thisControl.uniqueID
            let currentValue = Int(ratio * CGFloat(thisControl.valueHigh - thisControl.valueLow))
            
            try! realm.write {
                
                if currentValue > (thisControl.valueLow) {
                    thisControl.lastOnValue = currentValue
                }
                
                thisControl.valueCurrent = currentValue
            }
            
            DispatchQueue.global().async {
                HeepConnections().sendValueToHeepDevice(uniqueID: controlUniqueID)
            }
            
            
            saveSelectedSprite()
            
            // delay for 0.1 seconds to prevent sprite translation from kicking in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                self.longPressActive = false
                print("END LONG PRESS!")
            }
        }
        
    }


}

// Scrolling Functions  (thisGroup.selectedControl == 0)

extension VertexEditCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("End scrollView Deceleration")
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            thisGroup.contentOffsetX = collectionView.contentOffset.x
            thisGroup.contentOffsetY = collectionView.contentOffset.y
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            print("End scrollView Dragging")
            let realm = try! Realm(configuration: configUser)
            
            try! realm.write {
                thisGroup.contentOffsetX = collectionView.contentOffset.x
                thisGroup.contentOffsetY = collectionView.contentOffset.y
            }
        }
        
    }
}


// Drawing Functions
extension VertexEditCell {
    
    func drawVertex(vertex: Vertex, highlight: Bool = false, name: String? = nil) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let curve = UIBezierPath()
        let startPoint = CGPoint(x: (vertex.tx?.editX)!, y: (vertex.tx?.editY)!)
        let finishPoint = CGPoint(x: (vertex.rx?.editX)!, y: (vertex.rx?.editY)!)
        
        curve.move(to: startPoint)
        curve.addQuadCurve(to: finishPoint, controlPoint: CGPoint(x: (vertex.tx?.editX)!, y: (vertex.rx?.editY)!))
        shapeLayer.path = curve.cgPath
        shapeLayer.shadowPath = curve.cgPath
        shapeLayer.strokeColor = getModeColor(thisGroup: thisGroup, highlight: highlight).cgColor
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        if name == nil {
            shapeLayer.name = vertex.vertexID
        } else {
            shapeLayer.name = name
        }
        shapeLayer.accessibilityPath = curve
        return shapeLayer
    }
    
    func drawVertex(start: CGPoint, finish: CGPoint, name: String = "", highlight: Bool = false) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let curve = UIBezierPath()
        
        curve.move(to: start)
        curve.addQuadCurve(to: finish, controlPoint: CGPoint(x: start.x, y: finish.y))
        shapeLayer.path = curve.cgPath
        
        shapeLayer.strokeColor = getModeColor(thisGroup: thisGroup, highlight: highlight).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        if name != "" {
            shapeLayer.name = name
        }
        
        return shapeLayer
    }
    
    func drawLine(start: CGPoint, finish: CGPoint, name: String) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let curve = UIBezierPath()
        
        curve.move(to: start)
        curve.addLine(to: finish)
        shapeLayer.path = curve.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.name = name
        
        return shapeLayer
    }
    
    func getContextImage() -> UIImage? {
        
        return UIImage(data: thisGroup.imageData as Data)
    }
    
    func addControlSprite(thisControl: DeviceControl, applyTransform: Bool = true) -> UIView {
        controlIDs.append(thisControl.uniqueID)
        
        let container = UIView()
        container.frame = CGRect(x: thisControl.editX - 30,
                                     y: thisControl.editY - 30,
                                     width: 60,
                                     height: 60)
        
        container.layer.cornerRadius = 30
        container.clipsToBounds = true
        container.tag = controlIDs.count - 1
        container.layer.borderWidth = 2
        container.layer.borderColor = thisControl.uniqueID == thisGroup.selectedControl ? getModeColor(thisGroup: thisGroup, highlight: true).cgColor : getModeColor(thisGroup: thisGroup, highlight: false).cgColor
        container.tag = thisControl.uniqueID
        
        
        let controlSprite = UIImageView()
        let iconName = SuggestIconFromName(name: thisControl.controlName,
                                           state: thisControl.valueCurrent,
                                           lowVal: thisControl.valueLow)
        let image = UIImage(named: iconName) as UIImage?
        controlSprite.image = image
        controlSprite.contentMode = .scaleAspectFit
        let scaledSize = container.frame.width * 0.75
        let startPosition = (container.frame.width * 0.25) / 2
        controlSprite.frame = CGRect(x: startPosition,
                                     y: startPosition,
                                     width: scaledSize,
                                     height: scaledSize)
        
        let currentRangeContainer = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))

        let currentRange = UIView(frame: CGRect(x: 0, y: getControlValueRatio(control: thisControl) * 60, width: 60, height: 60))
        
        currentRange.backgroundColor = SuggestColorFromName(name: thisControl.controlName).withAlphaComponent(0.5)
        
        currentRangeContainer.transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: -thisControl.rotation)
        currentRangeContainer.addSubview(currentRange)
        
        container.addSubview(currentRangeContainer)
        
        container.addSubview(controlSprite)
        
        
        container.transform = CGAffineTransform(scaleX: thisControl.scale, y: thisControl.scale).rotated(by: thisControl.rotation)
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectThisController))
        
        container.addGestureRecognizer(tap)
        
        return container
    }
    
    func selectThisController(gesture: UITapGestureRecognizer) {

        if thisGroup.selectedControl == (gesture.view?.tag)!{
            toggleOnOff(controlUniqueID: (gesture.view?.tag)!)
        }
        else{
            let realm = try! Realm(configuration: configUser)
            try! realm.write {
                thisGroup.selectedControl = (gesture.view?.tag)!
            }
        }
        
    }
    
    func toggleOnOff(controlUniqueID: Int){
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        let realm = try! Realm(configuration: configUser)
        
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID)
        
        try! realm.write{
            thisControl?.valueCurrent = toggleDevice(control: thisControl!)
        }
        
        DispatchQueue.global().async {
            HeepConnections().sendValueToHeepDevice(uniqueID: controlUniqueID)
        }
        
    }
    
    func saveSelectedSprite() {
        let realm = try! Realm(configuration: configUser)
        
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
    
    func resetVertexDictToDelete() {
        vertexDictToDelete = [:]
        for control in thisGroup.controls {
            for vertex in control.vertexList {
                vertexDictToDelete[vertex.vertexID] = false
            }
        }
    }
    
    
    func addDetailButton() -> UIView {
        let realm = try! Realm(configuration: configUser)
        
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) else {
            return UIView()
        }
        
        
        let infoButton = UIButton(type: .detailDisclosure)
        infoButton.isUserInteractionEnabled = true
        infoButton.frame = CGRect(x: 0,
                                  y: 0,
                                  width: 15,
                                  height: 15)
        
        infoButton.tintColor = .blue
        infoButton.addTarget(self, action: #selector(displayDeviceSummary), for: .primaryActionTriggered)
        
        infoButton.transform = CGAffineTransform(translationX: thisControl.editX + (24 * thisControl.scale),
                                                 y: thisControl.editY - (30 * thisControl.scale)).scaledBy(x: thisControl.scale,
                                                                                                           y: thisControl.scale)
        return infoButton
    }
    
    func displayDeviceSummary() {
        let realm = try! Realm(configuration: configUser)
        
        if let control = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) {
            if let device = realm.object(ofType: Device.self, forPrimaryKey: control.deviceID) {
                let summaryView = DeviceSummaryViewController(device: device)
                parentTable.navigationController?.pushViewController(summaryView, animated: true)

            }
        }
        
    }
    
}


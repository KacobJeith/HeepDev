import UIKit
import RealmSwift

class VertexEditCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var parentTable = UITableViewController()
    var collectionView: UICollectionView!
    var controls = [DeviceControl]()
    
    var cellView = UICollectionViewCell()
    
    var controlIDs = [Int]()
    
    var thisGroup = GroupPerspective()
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
    
    convenience init(cellFrame: CGRect,
                     groupID: Int) {
        self.init()
        
        setupGroupAndControls(groupID: groupID)
        setupCollectionView(cellFrame: cellFrame)
        
    }
    
    func setupGroupAndControls(groupID: Int) {
        let realm = try! Realm(configuration: configUser)
        
        self.controls = realm.objects(DeviceControl.self).filter("groupID = %@", groupID).toArray()
        
        if let perspective = realm.object(ofType: GroupPerspective.self, forPrimaryKey: groupID) {
            self.thisGroup = perspective
        } else {
            print("Could not find perspective with this groupID")
        }
    }
    
    func setupCollectionView(cellFrame: CGRect) {
        
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
        
        setContextImage()
        
        addControlsAndVertices()
        setActiveGestures(cell: cell)
        
        return cell
    }
    
    func setContextImage() {
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: cellView.bounds.width,
                                                  height: cellView.bounds.height))
        
        let groupRealm = try! Realm(configuration: getGroupConfiguration(path: thisGroup.realmPath))
        
        guard let groupContext = groupRealm.objects(Group.self).first else {
            print("Could not retrieve shared group realm to grab the image")
            return
        }
        
        imageView.image = UIImage(data: groupContext.imageData as Data)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = 0
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
                                                  modeColor: getModeColor(thisGroup: thisGroup, highlight: true)))
            
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
                                              name: "circle",
                                              modeColor: getModeColor(thisGroup: thisGroup, highlight: false)))
        
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
                                              name: "circle",
                                              modeColor: getModeColor(thisGroup: thisGroup, highlight: false)))
        
        verifyControlForVertex(gesture: gesture,
                               direction: 1)

    }
        
    func findInputControl(gesture: UIPanGestureRecognizer) {
        
        cellView.layer.addSublayer(drawVertex(start: activeVertexStart,
                                              finish: gesture.location(in: cellView),
                                              name: "vertex",
                                              highlight: true))
        
        verifyControlForVertex(gesture: gesture,
                               direction: 0)
    
    }
    
    func verifyControlForVertex(gesture: UIPanGestureRecognizer, direction: Int) {
        
        if let touched = touchingControlSprite(gesture: gesture) {
            
            if direction == 0 && touched.controlDirection == direction {
                
                completeNewVertex(touched: touched)
                
            } else if direction == 1 && touched.controlDirection == direction {
                
                initializeNewVertex(touched: touched)
                
            }
            
        }
        
    }
    
    func initializeNewVertex(touched: DeviceControl) {
        
        activeVertexStart = CGPoint(x: touched.editX,
                                    y: touched.editY)
        activeVertex.tx = touched
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        cellView.layer.addSublayer(drawCircle(center: activeVertexStart,
                                              radius: 35,
                                              name: "start",
                                              modeColor: getModeColor(thisGroup: thisGroup, highlight: true)))
    }
    
    
    func completeNewVertex(touched: DeviceControl) {
        
        let newActiveVertexFinish = CGPoint(x: touched.editX,
                                            y: touched.editY)
        
        if newActiveVertexFinish != activeVertexFinish {
            activeVertexFinish = CGPoint(x: touched.editX,
                                         y: touched.editY)
            
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
            activeVertex.rx = touched
            
            searchSublayersForNameToRemove(names: ["finish"])
            
            cellView.layer.addSublayer(drawCircle(center: activeVertexFinish,
                                                  radius: 35,
                                                  name: "finish",
                                                  modeColor: getModeColor(thisGroup: thisGroup, highlight: true)))
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
    
    func touchingControlSprite(gesture: UIPanGestureRecognizer) -> DeviceControl? {
        
        for control in controls {
            
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
    
    func handlePan(gesture: UIPanGestureRecognizer){
        if !longPressActive {
            translateSpritePosition(gesture: gesture)
        }
    }
    
    func translateSpritePosition(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let controlView = self.viewWithTag(thisGroup.selectedControl)!
        
        controlView.center.x += translation.x
        controlView.center.y += translation.y
        
        resolveConnectedVertices(controlView: controlView)
        
        gesture.setTranslation(CGPoint(), in: self)
        
        switch gesture.state {
        case .ended :
            
            saveSelectedSprite()
            
        default : break
        }
    }
    
    func resolveConnectedVertices(controlView: UIView) {
        
        searchSublayersForNameToRemove(names: [String(thisGroup.selectedControl)])
        let realm = try! Realm(configuration: configUser)
        guard let control = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) else { return}
        
        for eachControl in controls {
            for vertex in eachControl.vertexList {
                
                translateConnectedVertex(control: control, vertex: vertex, controlView: controlView)
                
            }
        }
    }
    
    func translateConnectedVertex(control: DeviceControl, vertex: Vertex, controlView: UIView) {
        
        guard let index = vertex.vertexID.range(of: String(describing: control.uniqueID)) else { return }
        guard let txX = vertex.tx?.editX else { return }
        guard let txY = vertex.tx?.editY else { return }
        guard let rxX = vertex.rx?.editX else { return }
        guard let rxY = vertex.rx?.editY else { return }
        
        let calculatedIndex = vertex.vertexID.distance(from: vertex.vertexID.startIndex,
                                                       to: index.lowerBound)
        
        var start = CGPoint(x: controlView.center.x, y: controlView.center.y)
        var finish = CGPoint(x: rxX, y: rxY)
        
        if calculatedIndex != 0 {
            start = CGPoint(x: txX, y: txY)
            finish = CGPoint(x: controlView.center.x, y: controlView.center.y)
        }
        
        let newPath = drawVertex(start: start, finish: finish)
        newPath.name = vertex.vertexID
        
        cellView.layer.addSublayer(newPath)
        
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
        let realm = try! Realm(configuration: configUser)
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) else {
            print("Failed to retrieve the control from realm")
            return
        }
        
        var ratio: CGFloat = 0.5
        
        if longPressActive == true {
             ratio = duringLongPressActive(control: thisControl, gesture: gestureRecognizer)
        }
        
        switch gestureRecognizer.state {
            
        case .began :
            
            initializeLongPress(control: thisControl, gesture: gestureRecognizer)
            
        case .ended :
            
            finalizeLongPress(control: thisControl, ratio: ratio)
            
        default : break
            
        }
        
        
    }
    
    func initializeLongPress(control: DeviceControl, gesture: UILongPressGestureRecognizer) {
        longPressActive = true
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        startSliderRatio = 1.0 - getControlValueRatio(control: control)
        initialLongPressLocation = gesture.location(in: gesture.view)
        
        print("BEGIN LONG PRESS!")
    }
    
    func duringLongPressActive(control: DeviceControl, gesture: UILongPressGestureRecognizer) -> CGFloat {
        
        guard let myView = self.viewWithTag(thisGroup.selectedControl) else {
            print("Could not find this view")
            return 0.5
        }
        
        let transform = calculateLongPressTransform(gesture: gesture)
        
        myView.subviews[0].subviews[0].frame = CGRect(x: 0, y: transform.yTransform, width: 60, height: 60)
        
        let slidingValue = Int( transform.ratio * CGFloat(control.valueHigh - control.valueLow) )
        let passControlID = control.uniqueID
        
        //timeSince returns false if duration is less than timeInterval specified
        if ( SuccessROPReceived || !lessThanTimeInterval(start: lastSendTime, end: DispatchTime.now(), timeInterval: 10_000_000) ) && slidingValue != lastSlidingValue {
            
            DispatchQueue.global().async(){
                HeepConnections().sendValueToHeepDevice(uniqueID: passControlID,
                                                        currentValue: slidingValue )
            }
            
            SuccessROPReceived = false
            lastSlidingValue = slidingValue
            lastSendTime = DispatchTime.now()
        }
        
        return transform.ratio
    }
    
    func calculateLongPressTransform(gesture: UILongPressGestureRecognizer) -> (yTransform: CGFloat, ratio: CGFloat) {
        let location = gesture.location(in: gesture.view)
        let maxFingerRange = CGFloat(200.0)
        let startingRatioOffset = ( maxFingerRange * startSliderRatio ) - CGFloat( maxFingerRange/2.0 )
        
        var offset = (initialLongPressLocation.y - location.y) + CGFloat(maxFingerRange/2.0) + startingRatioOffset
        
        if offset > maxFingerRange{
            offset = maxFingerRange
        }
        else if offset < 0 {
            offset = 0
        }
        
        let ratio = offset / maxFingerRange
        
        let yTransform = 60 * (1.0 - ratio)
        
        return (yTransform: yTransform, ratio: ratio)
    }
    
    func finalizeLongPress(control: DeviceControl, ratio: CGFloat) {
        let realm = try! Realm(configuration: configUser)
        
        let controlUniqueID = control.uniqueID
        let currentValue = Int(ratio * CGFloat(control.valueHigh - control.valueLow))
        
        try! realm.write {
            
            if currentValue > (control.valueLow) {
                control.lastOnValue = currentValue
            }
            
            control.valueCurrent = currentValue
        }
        
        DispatchQueue.global().async {
            HeepConnections().sendValueToHeepDevice(uniqueID: controlUniqueID)
        }
        
        
        saveSelectedSprite()
        
        // delay for 0.1 seconds to prevent sprite translation from kicking in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.longPressActive = false
        }
    }


}

// Scrolling Functions  (thisGroup.selectedControl == 0)

extension VertexEditCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            thisGroup.contentOffsetX = collectionView.contentOffset.x
            thisGroup.contentOffsetY = collectionView.contentOffset.y
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            
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
        
        guard let txX = vertex.tx?.editX else { return CAShapeLayer()}
        guard let txY = vertex.tx?.editY else { return CAShapeLayer()}
        guard let rxX = vertex.rx?.editX else { return CAShapeLayer()}
        guard let rxY = vertex.rx?.editY else { return CAShapeLayer()}
        
        let startPoint = CGPoint(x: txX, y: txY)
        let finishPoint = CGPoint(x: rxX, y: rxY)
        
        curve.move(to: startPoint)
        curve.addQuadCurve(to: finishPoint,
                           controlPoint: CGPoint(x: txX, y: rxY))
        
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
    
    func getContextImage() -> UIImage? {
        let groupRealm = try! Realm(configuration: getGroupConfiguration(path: thisGroup.realmPath))
        
        guard let groupContext = groupRealm.objects(Group.self).first else {
            print("Could not retrieve shared group realm to grab the image")
            return nil
        }
        
        return UIImage(data: groupContext.imageData as Data)
    }
    
    func addControlSprite(thisControl: DeviceControl, applyTransform: Bool = true) -> UIView {
        
        controlIDs.append(thisControl.uniqueID)
        
        let containerFrame = CGRect(x: thisControl.editX - 30,
                                 y: thisControl.editY - 30,
                                 width: 60,
                                 height: 60)
        
        let spriteContainer = addSpriteFrame(control: thisControl, frame: containerFrame)
        let spriteImage = addSpriteImage(control: thisControl, containerWidth: containerFrame.width)
        let spriteRange = addSpriteRangeIndicator(control: thisControl, frame: containerFrame)
        
        spriteContainer.addSubview(spriteRange)
        spriteContainer.addSubview(spriteImage)
        
        spriteContainer.transform = CGAffineTransform(scaleX: thisControl.scale, y: thisControl.scale).rotated(by: thisControl.rotation)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectThisController))
        spriteContainer.addGestureRecognizer(tap)
        
        return spriteContainer
    }
    
    func addSpriteFrame(control: DeviceControl, frame: CGRect) -> UIView {
        let container = UIView(frame: frame)
        
        container.layer.cornerRadius = 30
        container.clipsToBounds = true
        container.tag = controlIDs.count - 1
        container.layer.borderWidth = 2
        container.layer.borderColor = control.uniqueID == thisGroup.selectedControl ? getModeColor(thisGroup: thisGroup, highlight: true).cgColor : getModeColor(thisGroup: thisGroup, highlight: false).cgColor
        container.tag = control.uniqueID
        
        return container
    }
    
    func addSpriteImage(control: DeviceControl, containerWidth: CGFloat) -> UIView {
        let controlSprite = UIImageView()
        let iconName = SuggestIconFromName(name: control.controlName,
                                           state: control.valueCurrent,
                                           lowVal: control.valueLow)
        let image = UIImage(named: iconName) as UIImage?
        controlSprite.image = image
        controlSprite.contentMode = .scaleAspectFit
        let scaledSize = containerWidth * 0.75
        let startPosition = (containerWidth * 0.25) / 2
        controlSprite.frame = CGRect(x: startPosition,
                                     y: startPosition,
                                     width: scaledSize,
                                     height: scaledSize)
        
        return controlSprite
    }
    
    func addSpriteRangeIndicator(control: DeviceControl, frame: CGRect) -> UIView {
        
        let currentRangeContainer = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: 60,
                                                         height: 60))
        
        let currentRange = UIView(frame: CGRect(x: 0,
                                                y: getControlValueRatio(control: control) * 60,
                                                width: 60,
                                                height: 60))
        
        currentRange.backgroundColor = SuggestColorFromName(name: control.controlName).withAlphaComponent(0.5)
        currentRangeContainer.transform = CGAffineTransform(rotationAngle: -control.rotation)

        currentRangeContainer.addSubview(currentRange)
        
        return currentRangeContainer
    }
    
    func selectThisController(gesture: UITapGestureRecognizer) {
        
        guard let tag = gesture.view?.tag else {
            print("Selected view did not have a tag")
            return
        }
        
        if thisGroup.selectedControl == tag {
            
            toggleOnOff(controlUniqueID: tag)
            
        } else {
            let realm = try! Realm(configuration: configUser)
            
            try! realm.write {
                thisGroup.selectedControl = tag
            }
        }
        
    }
    
    func toggleOnOff(controlUniqueID: Int) {
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        DispatchQueue.global().async {
            HeepConnections().sendValueToHeepDevice(uniqueID: controlUniqueID)
        }
        
        let realm = try! Realm(configuration: configUser)
        
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID) else {
            print("Could not retrieve the control from realm")
            return
        }
        
        try! realm.write{
            thisControl.valueCurrent = toggleDevice(control: thisControl)
        }
        
        
    }
    
    func saveSelectedSprite() {
        let realm = try! Realm(configuration: configUser)
        
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) else {
            print("Could not retrieve the control from realm")
            return
        }
        
        guard let myView = self.viewWithTag(thisGroup.selectedControl) else {
            print("Could not find the selected control in the view")
            return
        }
        
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
        for control in controls {
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
        
        guard let control = realm.object(ofType: DeviceControl.self, forPrimaryKey: thisGroup.selectedControl) else {
            print("Could not retrieve control")
            return
        }
        
        guard let device = realm.object(ofType: Device.self, forPrimaryKey: control.deviceID) else {
            print("Could not retrieve device")
            return
        }
        
        let summaryView = DeviceSummaryViewController(device: device)
        parentTable.navigationController?.pushViewController(summaryView, animated: true)

    }
    
}

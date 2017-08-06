import UIKit

class UnassignedControlCollection: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var controls: [DeviceControl] = []
    var thisGroup = GroupPerspective()
    
    convenience init(groupID: Int) {
        self.init()
        
        setControlsAndGroup(groupID: groupID)
        setupCollectionView()
        
    }
    
    func setControlsAndGroup(groupID: Int) {
        
        self.controls = database().getDeviceControlsInGroup(groupID: 0)
        
        guard let group = database().getGroupContext(groupID: groupID) else {
            print("Failed to find context for unassigned")
            return
        }
    
        self.thisGroup = group
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: screenWidth,height: 100) , collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.contentOffset = CGPoint(x: thisGroup.unassignedOffsetX, y: 0)
        
        self.addSubview(collectionView)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as UICollectionViewCell
        
        let bigWhiteBackground = UIView()
        bigWhiteBackground.backgroundColor = .white
        bigWhiteBackground.frame = cell.bounds
        
        let basicPuck = createControlPuck(thisControl: controls[indexPath.row], cellSize: cell.bounds)
        
        let bigButton = UIButton()
        bigButton.frame = cell.bounds
        bigButton.backgroundColor = UIColor.clear
        bigButton.tag = indexPath.row
        
        bigButton.addTarget(self,action: #selector(selectControl),for: [UIControlEvents.primaryActionTriggered])
        
        cell.addSubview(bigWhiteBackground)
        cell.addSubview(basicPuck)
        cell.addSubview(bigButton)
        
        return cell
    }
    
}

extension UnassignedControlCollection {
    
    func selectControl(sender: UIButton) {
        
        if let place = database().getPlaceContext(id: thisGroup.placeID) {
            
            let update = PlacePerspective(value: place)
            update.numDevices += 1
            
            database().updatePlaceContext(placeContext: update)
        }
        
        let controlUpdate = DeviceControl(value: controls[sender.tag])
        controlUpdate.groupID = thisGroup.groupID
        
        database().updateDeviceControl(control: controlUpdate)
        
        
        let groupUpdate = GroupPerspective(value: thisGroup)
        groupUpdate.selectedControl = controls[sender.tag].uniqueID
        groupUpdate.unassignedOffsetX = collectionView.contentOffset.x
        
        database().updateGroupContext(update: groupUpdate)
        
        
    }
    
    // Scrolling Functions  (thisGroup.selectedControl == 0)
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        updateScrollOffset(offsetX: collectionView.contentOffset.x)
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            updateScrollOffset(offsetX: collectionView.contentOffset.x)
        }
        
    }
    
    func updateScrollOffset(offsetX: CGFloat) {
        let groupUpdate = GroupPerspective(value: thisGroup)
        groupUpdate.unassignedOffsetX = offsetX
        
        database().updateGroupContext(update: groupUpdate)
    }
    

}

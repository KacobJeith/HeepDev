import UIKit

class UnassignedControlCollection: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var controls = [Int: DeviceControl]()
    var thisGroup = GroupPerspective()
    var controlKeys = [Int]()
    
    convenience init(groupContext: GroupPerspective, unassignedControls: [Int: DeviceControl]) {
        self.init()
        
        self.thisGroup = groupContext
        self.controls = unassignedControls
        self.controlKeys = [Int](unassignedControls.keys)
        
        setupCollectionView()
        
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
        
        guard let thisControl = controls[controlKeys[indexPath.row]] else {
            print("Failed to grab this index")
            return cell
        }
        
        let basicPuck = createControlPuck(thisControl: thisControl, cellSize: cell.bounds)
        
        let bigButton = UIButton()
        bigButton.frame = cell.bounds
        bigButton.backgroundColor = UIColor.clear
        bigButton.tag = thisControl.uniqueID
        
        bigButton.addTarget(self,action: #selector(selectControl),for: [UIControlEvents.primaryActionTriggered])
        
        cell.addSubview(bigWhiteBackground)
        cell.addSubview(basicPuck)
        cell.addSubview(bigButton)
        
        return cell
    }
    
}

extension UnassignedControlCollection {
    
    func selectControl(sender: UIButton) {
        
        guard let selectedControl = controls[sender.tag] else {
            print("Could not find control for tag \(sender.tag)")
            return
        }
        
        let controlUpdate = DeviceControl(value: selectedControl)
        controlUpdate.groupID = thisGroup.groupID
        
        database().updateDeviceControl(control: controlUpdate)
        
        let groupUpdate = GroupPerspective(value: thisGroup)
        groupUpdate.selectedControl = selectedControl.uniqueID
        groupUpdate.unassignedOffsetX = collectionView.contentOffset.x
        
        database().updateGroupContext(update: groupUpdate)
        
        database().getPlaceContext(id: thisGroup.placeID) { (context) in
            
            guard let place = context else {
                print("Failed to get placeContext")
                return
            }
            
            let update = PlacePerspective(value: place)
            update.numDevices += 1
            
            database().updatePlaceContext(placeContext: update)
        }
        
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

import UIKit
import RealmSwift

class UnassignedControlCollection: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var controls: [DeviceControl] = []
    var thisGroup = GroupPerspective()
    
    convenience init(groupID: Int,
                     indexPath: IndexPath) {
        self.init()
        
        let realm = try! Realm(configuration: configUser)
        
        self.controls = realm.objects(DeviceControl.self).filter("groupID = 0").toArray()
        
        if let group = realm.object(ofType: GroupPerspective.self, forPrimaryKey: groupID) {
            thisGroup = group
        } else {
            print("Failed to find perspective for unassigned")
        }
        
        
        
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
        let realm = try! Realm(configuration: configUser)
        
        print(realm.object(ofType: DeviceControl.self, forPrimaryKey: controls[sender.tag].uniqueID)!)

        try! realm.write {
            controls[sender.tag].groupID = thisGroup.groupID
            thisGroup.selectedControl = controls[sender.tag].uniqueID
            thisGroup.unassignedOffsetX = collectionView.contentOffset.x
        }
        
    }
    
    // Scrolling Functions  (thisGroup.selectedControl == 0)
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            thisGroup.unassignedOffsetX = collectionView.contentOffset.x
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            
            let realm = try! Realm(configuration: configUser)
            
            try! realm.write {
                thisGroup.unassignedOffsetX = collectionView.contentOffset.x
            }
        }
        
    }
    

}

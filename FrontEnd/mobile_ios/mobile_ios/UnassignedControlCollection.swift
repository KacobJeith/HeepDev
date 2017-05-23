import UIKit
import RealmSwift

class UnassignedControlCollection: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let realm = try! Realm(configuration: config)
    var collectionView: UICollectionView!
    var controls: [DeviceControl] = []
    var parentTable = UITableView()
    var thisBSSID = ""
    var thisGroup = Group()
    var myIndexPath = IndexPath()
    var notificationToken: NotificationToken? = nil
    
    
    convenience init(bssid: String,
                     parentTable: UITableView,
                     thisGroup: Group,
                     indexPath: IndexPath) {
        self.init()
        
        
        self.thisBSSID = bssid
        self.myIndexPath = indexPath
        let results = realm.objects(DeviceControl.self).filter("place = %@ AND groupsAssigned = 0", thisBSSID)
        self.controls = Array(results)
        self.thisGroup = thisGroup
        self.myIndexPath = indexPath
        
        
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
        
        
        notificationToken = results.addNotificationBlock {  [weak self] (changes: RealmCollectionChange) in
            
            switch changes {
            case .update:
                
                parentTable.reloadData()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default: break
                
            }
        }
        
        
        
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
        let realm = try! Realm(configuration: config)
        print(controls[sender.tag].uniqueID)
        print(realm.object(ofType: DeviceControl.self, forPrimaryKey: controls[sender.tag].uniqueID)!)
        print("Adding to group!")
        print(self.thisGroup.name)
        let addToGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)!
        
        try! realm.write {
            controls[sender.tag].groupsAssigned += 1
            addToGroup.controls.append(controls[sender.tag])
            addToGroup.selectedControl = controls[sender.tag].uniqueID
            thisGroup.unassignedOffsetX = collectionView.contentOffset.x
        }
        
    }
    
    // Scrolling Functions  (thisGroup.selectedControl == 0)
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let realm = try! Realm(configuration: config)
        
        try! realm.write {
            thisGroup.unassignedOffsetX = collectionView.contentOffset.x
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            
            let realm = try! Realm(configuration: config)
            
            try! realm.write {
                thisGroup.unassignedOffsetX = collectionView.contentOffset.x
            }
        }
        
    }
    

}

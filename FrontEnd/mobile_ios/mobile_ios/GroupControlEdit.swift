import UIKit
import RealmSwift

class GroupControlEdit: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var controls = List<DeviceControl>()
    var thisBSSID = ""
    var thisGroup = Group()
    var myIndexPath = IndexPath()
    
    convenience init(groupID: Int) {
        self.init()
        
        let realm = try! Realm(configuration: configUser)
        
        self.thisBSSID = bssid
        self.controls = thisGroup.controls
        self.myIndexPath = indexPath
        self.thisGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)!
        
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
        collectionView.contentOffset = CGPoint(x: thisGroup.assignedOffsetX, y: 0)
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
        
        let basicPuck = createControlPuck(thisControl: controls[indexPath.row],
                                          cellSize: cell.bounds)
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor =  UIColor.clear.cgColor
        
        let bigButton = UIButton()
        bigButton.frame = cell.bounds
        bigButton.backgroundColor = UIColor.clear
        bigButton.tag = indexPath.row
        
        bigButton.addTarget(self,action: #selector(selectControl),for: [UIControlEvents.primaryActionTriggered])
        
        if (thisGroup.selectedControl == controls[indexPath.row].uniqueID) {
            
            cell.layer.borderColor =  UIColor.blue.cgColor
        }
        
        
        cell.addSubview(basicPuck)
        cell.addSubview(bigButton)
        
        return cell
    }
    
}

extension GroupControlEdit {
    
    func selectControl(sender: UIButton) {
        print("Selected \(controls[sender.tag].controlName)")
        
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            if thisGroup.selectedControl == controls[sender.tag].uniqueID {
                thisGroup.selectedControl = 0
            } else {
                thisGroup.selectedControl = controls[sender.tag].uniqueID
            }
            thisGroup.assignedOffsetX = collectionView.contentOffset.x
            
        }
        
        print(thisGroup.selectedControl)
        
    }
    
    // Scrolling Functions  (thisGroup.selectedControl == 0)
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            thisGroup.assignedOffsetX = collectionView.contentOffset.x
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            
            let realm = try! Realm(configuration: configUser)
            
            try! realm.write {
                thisGroup.assignedOffsetX = collectionView.contentOffset.x
            }
        }
        
    }
    
}

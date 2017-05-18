import UIKit
import RealmSwift

class DeviceControlPuck: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //let realm = try! Realm(configuration: config)
    var collectionView: UICollectionView!
    var controls: [DeviceControl] = []
    var thisBSSID = ""
    var thisGroup = Group()
    var controlIDs = [String]()
    var parentTable = UITableView()
    var notificationToken: NotificationToken? = nil
    
    deinit{
        notificationToken?.stop()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let realm = try! Realm(configuration: config)
        notificationToken = realm.addNotificationBlock { [unowned self] note, realm in
            //self.thisPlace = realm.object(ofType: Place.self, forPrimaryKey: self.thisPlace.bssid)!
            print("Detected Changes")
            //DispatchQueue.main.async{
            self.parentTable.reloadData()
            //}
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
        
        self.addSubview(collectionView)
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
        
        let bigWhiteBox = UIView()
        bigWhiteBox.frame = CGRect(x: 0, y: 0, width: 80, height: 100)
        bigWhiteBox.backgroundColor = .white
        
        let iconName = SuggestIconFromName(name: controls[indexPath.row].controlName)
        let image = UIImage(named: iconName) as UIImage?
        let deviceSprite = UIButton()
        deviceSprite.setBackgroundImage(image, for: [])
        deviceSprite.contentHorizontalAlignment = .center
        deviceSprite.contentMode = .scaleAspectFit
        deviceSprite.frame = CGRect(x: 15, y: 0, width: 50, height: 70)
        
        
        let title = UILabel(frame: CGRect(x:0, y:70, width: cell.bounds.size.width, height: 20))
        title.adjustsFontSizeToFitWidth = true
        title.text = controls[indexPath.row].controlName
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        
        let bigButton = UIButton()
        bigButton.frame = CGRect(x: 0, y: 0, width: 80, height: 100)
        bigButton.backgroundColor = UIColor.clear
        bigButton.tag = indexPath.row
        
        bigButton.addTarget(self,action: #selector(selectControl),for: [UIControlEvents.primaryActionTriggered])
        
        
        cell.addSubview(bigWhiteBox)
        cell.addSubview(deviceSprite)
        cell.addSubview(title)
        cell.addSubview(bigButton)
        
        return cell
    }
    
}

extension DeviceControlPuck {
    
    func selectControl(sender: UIButton) {
        let realm = try! Realm(configuration: config)
        print(controls[sender.tag].uniqueID)
        print(realm.object(ofType: DeviceControl.self, forPrimaryKey: controls[sender.tag].uniqueID)!)
        let addToGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)
        
        try! realm.write {
            controls[sender.tag].groupsAssigned += 1
            addToGroup?.controls.append(controls[sender.tag])
        }
        
    }
    
}

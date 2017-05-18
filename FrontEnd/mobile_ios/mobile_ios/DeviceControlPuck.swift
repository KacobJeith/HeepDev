import UIKit
import RealmSwift

class DeviceControlPuck: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let realm = try! Realm(configuration: config)
    var collectionView: UICollectionView!
    var controls: [DeviceControl] = []
    var thisBSSID = ""
    var thisGroup = Group()
    var controlIDs = [String]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: 80, height: 100)
        
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
        print(controls[sender.tag])
        let pushControl = controls[sender.tag]
        let realm = try! Realm(configuration: config)
        // existing group controls
        let groupToAddTo = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)
        //let appendedControls = groupToAddTo?.controls.append(pushControl)
        
        
        try! realm.write {
            realm.create(DeviceControl.self,
                         value: ["groupUnassigned", 0,
                                 "uniqueID", controls[sender.tag].uniqueID],
                         update: true)
            
            //var sendControls = (groupToAddTo?.controls)!
            
            if (groupToAddTo?.controls) != nil {
                print("Appending new control")
                (groupToAddTo?.controls)!.append(pushControl)
            }
        }
        
    }
    
}

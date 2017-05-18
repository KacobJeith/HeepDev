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
                parentTable.reloadRows(at: [self.myIndexPath], with: UITableViewRowAnimation.none)
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default:
                print("Eff Swift lol")
            }
        }
    }
    
    deinit{
        notificationToken?.stop()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        layout.itemSize = CGSize(width: 400, height: 400)
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: screenWidth + 40,height: 440) , collectionViewLayout: layout)
        
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
        
        for eachControl in controls {
            
            let controlSprite = addControlSprite(cell: cell, thisControl: eachControl)
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
        imageView.frame = cell.bounds
        imageView.tag = indexPath.row

        return imageView
    }
    
    func addControlSprite(cell: UICollectionViewCell, thisControl: DeviceControl) -> UIButton {
        controlIDs.append(thisControl.uniqueID)
        
        let iconName = SuggestIconFromName(name: thisControl.controlName)
        let image = UIImage(named: iconName) as UIImage?
        let controlSprite = UIButton(frame: CGRect(x: thisControl.editX - 30,
                                                   y: thisControl.editY - 30,
                                                   width: 60,
                                                   height: 60))
        
        controlSprite.setBackgroundImage(image, for: [])
        controlSprite.contentMode = .scaleAspectFit
        controlSprite.layer.cornerRadius = 0.5 * controlSprite.bounds.size.width
        controlSprite.clipsToBounds = true
        controlSprite.tag = controlIDs.count - 1
        
        controlSprite.addTarget(self,
                               action: #selector(drag),
                               for: [UIControlEvents.touchDragInside,
                                     UIControlEvents.touchDragOutside,
                                     UIControlEvents.touchDragExit])
        
        return controlSprite
    }
    
    func drag(control: UIControl, event: UIEvent) {
        
        if let center = event.allTouches?.first?.location(in: self.collectionView) {
            control.center = center
            //saveDragPosition(center: center,
            //                 uniqueID: controlIDs[(event.allTouches?.first?.view!.tag)!])
        }
    }
    
    func saveDragPosition(center: CGPoint, uniqueID: String) {
        let realm = try! Realm(configuration: config)
        try! realm.write {
            realm.create(DeviceControl.self,
                         value: ["uniqueID": uniqueID,
                                 "editX": center.x,
                                 "editY": center.y],
                         update: true)
        }
    }
    
}

import UIKit
import RealmSwift

class DeviceControlPuck: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var devices: [Device] = []
    var controls: [DeviceControl] = []
    var controlDeviceReference: [Device] = []
    var controlIDs = [String]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: 150, height: 100)
        
        
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
        for eachDevice in devices {
            for eachControl in eachDevice.controlList {
                controls.append(eachControl)
                controlDeviceReference.append(eachDevice)
            }
        }
        
        return controls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as UICollectionViewCell
        
        let bigWhiteBox = UIView()
        bigWhiteBox.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        bigWhiteBox.backgroundColor = .white
        
        let iconName = SuggestIconFromName(name: controls[indexPath.row].controlName)
        let image = UIImage(named: iconName) as UIImage?
        let deviceSprite = UIButton()
        deviceSprite.setBackgroundImage(image, for: [])
        deviceSprite.contentHorizontalAlignment = .center
        deviceSprite.contentMode = .scaleAspectFit
        deviceSprite.frame = CGRect(x: 50, y: 0, width: 50, height: 70)
        deviceSprite.tag = indexPath.row
        
        let title = UILabel(frame: CGRect(x:0, y:70, width: cell.bounds.size.width, height: 20))
        title.adjustsFontSizeToFitWidth = true
        title.text = controls[indexPath.row].controlName
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        
        cell.addSubview(bigWhiteBox)
        cell.addSubview(deviceSprite)
        cell.addSubview(title)
        
        return cell
    }
    
}

extension DeviceControlPuck {
    
    func drawDevice(control: DeviceControl, iconName: String, tag: Int) -> UIButton {
        //controlIDs.append(control.uniqueID)
        let image = UIImage(named: iconName) as UIImage?
        let deviceSprite = UIButton()
        deviceSprite.setBackgroundImage(image, for: [])
        deviceSprite.contentMode = .scaleAspectFit
        deviceSprite.contentHorizontalAlignment = .center
        //deviceSprite.frame = CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 60)
        deviceSprite.tag = tag
        /*
        deviceSprite.addTarget(self,
                               action: #selector(drag),
                               for: [UIControlEvents.touchDragInside,
                                     UIControlEvents.touchDragOutside,
                                     UIControlEvents.touchDragExit])*/
        
        return deviceSprite
    }
}

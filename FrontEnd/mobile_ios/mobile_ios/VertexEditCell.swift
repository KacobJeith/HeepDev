import UIKit
import RealmSwift

class VertexEditCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var devices: [Device] = []
    var controls: [DeviceControl] = []
    var controlDeviceReference: [Device] = []
    var thisBSSID: String = ""
    var editImage: UIImage = UIImage()
    var controlIDs = [String]()
    
    
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
        
        let imageView = UIImageView(frame: cell.bounds)
        imageView.image = editImage
        imageView.contentMode = .scaleAspectFit
        imageView.frame = cell.bounds
        imageView.tag = indexPath.row
        
        cell.addSubview(imageView)
        
        return cell
    }
    
}

extension VertexEditCell {
    /*
    func drag(control: UIControl, event: UIEvent) {
        
        
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
            saveDragPosition(center: center,
                             uniqueID: controlIDs[(event.allTouches?.first?.view!.tag)!])
        }
    }*/
    
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

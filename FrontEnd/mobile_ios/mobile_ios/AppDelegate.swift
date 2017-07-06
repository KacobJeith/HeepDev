//
//  AppDelegate.swift
//  mobile_ios
//
//  Created by Jacob Keith on 4/20/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import UserNotifications
import CoreLocation
import FacebookCore

let digitalOceanHTTP = "http://45.55.249.217:9080"
let digitalOceanRealm = "realm://45.55.249.217:9080"
let digitalOceamUserRealm = "realm://45.55.249.217:9080/~/heepzone"
let dititalOceanPublicRealm = "realm://45.55.249.217:9080/3236896a34becbac18c96a9a24c55de9/userDirectory"

var configGuest = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
var configUser = configGuest
var configPublicSync =  Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!,
                                                                                 realmURL: URL(string: dititalOceanPublicRealm)!),
                                            objectTypes: [User.self])

protocol AddBeacon {
    func addBeacon(beacon: HeepBeacon)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let locationManager = CLLocationManager()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        flushApp()
        //logoutOfAllRealmUsers()
        initializeApp()
        setupAppNavigation()
        startMonitoringBeacon()
        
        //logoutOfAllRealmUsers()
        //loginToPublicRealm()
        
        return true
    }
    
    func startMonitoringBeacon() {
        // Request permission to send notifications
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.alert, .sound]) { (granted, error) in }
        
        locationManager.delegate = self
        
        var delegate: AddBeacon?
        
        // Create new Heep Beacon
        let uuidString = "B87273A8-3C02-11E7-A919-92EBCB67FE33"
        let uuid = UUID(uuidString: uuidString)
        let major = 256
        let minor = 65535
        let name = "HEEP HQ"
        
        let newBeacon = HeepBeacon(name: name, uuid: uuid!, majorValue: major, minorValue: minor)
        
        delegate?.addBeacon(beacon: newBeacon)
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        
        let beaconRegion = newBeacon.asBeaconRegionIgnoreMajorMinor()
        
        locationManager.startMonitoring(for: beaconRegion)
        
    }

    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return SDKApplicationDelegate.shared.application(application,
                                                         open: url,
                                                         options: [UIApplicationOpenURLOptionsKey.annotation : annotation,
                                                                   UIApplicationOpenURLOptionsKey.sourceApplication : sourceApplication!])
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "mobile_ios")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

extension AppDelegate {
    func setupAppNavigation() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainController = PlacesView()
        let navigationController = UINavigationController(rootViewController: mainController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.isToolbarHidden = true
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

// MARK: - CLLocationManagerDelegate
extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        //region must be cast as CLBeaconRegion to expose UUID & major/minor variables
        let r = (region as! CLBeaconRegion)
        
        //Here we can act on the beacons depending on their Major & Minor data
        print("I see a beacon:")
        print("Name: \(r.identifier)")
        print("UUID: \(r.proximityUUID)")
        print("Major: \(r.major)")
        print("Minor: \(r.minor)")
        
        let content = UNMutableNotificationContent()
        content.title = "Heep Zone"
        content.body = "You are now entering the Heep Zone™"
        content.sound = .default()
        
        let request = UNNotificationRequest(identifier: "Heep", content: content, trigger: nil)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}




//
//  mobile_iosTests.swift
//  mobile_iosTests
//
//  Created by Jacob Keith on 4/20/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import XCTest
@testable import mobile_ios

class mobile_iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Device Class Tests
    //Confirm that the Device initializer returns a Device Object when passed valid parameters. 
    
    func testDeviceInitializationSucceeds() {
        let basicDevice = Device.init(name: "Blinky", photo: nil)
        XCTAssertNotNil(basicDevice)
    }
    
}

//
//  SampleUITestsProjectUITests.swift
//  SampleUITestsProjectUITests
//
//  Created by Clement Roulland on 16-11-02.
//  Copyright © 2016 clement. All rights reserved.
//

import XCTest
import SBTUITestTunnel

class SampleUITestsProjectUITests: XCTestCase {
    
    var app = SBTUITunneledApplication()
        
    override func setUp() {
        super.setUp()
        
        
        continueAfterFailure = false
        
        app.launchTunnel(withOptions: [SBTUITunneledApplicationLaunchOptionResetFilesystem])

        Thread.sleep(forTimeInterval: 1.0)
    }
    
    override func tearDown() {
        
        app.stubRequestsRemoveAll()
        
        super.tearDown()
    }
    
    func test_callAPI_failed() {
        
        app.stubRequests(matching: SBTRequestMatch.url("jsonplaceholder.typicode.com"), returnJsonDictionary: ["key": "value"], returnCode: 200, responseTime: 0.0)
        
        app.buttons["Make a call"].tap()
        XCTAssert(app.staticTexts["Failed 😢"].exists)
        
    }
    
    func test_callAPI_succeed() {
        
        app.stubRequests(matching: SBTRequestMatch.url("jsonplaceholder.typicode.com"), returnJsonDictionary: ["title": "Succeed 😎"], returnCode: 200, responseTime: 0.0)
        
        app.buttons["Make a call"].tap()
        XCTAssert(app.staticTexts["Succeed 😎"].exists)
        
    }
    
}

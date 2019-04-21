//
//  DetestableMeUITests.swift
//  DetestableMeUITests
//
//  Created by Dorin Danciu on 3/15/19.
//  Copyright © 2019 Beilmo. All rights reserved.
//

import XCTest

class HandlePermisionAlertsUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        resolveLocationPermission(.always)
        resolveNotificationsPermission(.allow)
        resolveMicrophonePermission(.ok)

        app.tap()
    }
}

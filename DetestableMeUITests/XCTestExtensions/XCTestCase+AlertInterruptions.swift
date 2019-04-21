//
//  XCTestCase+SystemPermissions.swift
//  DetestableMeUITests
//
//  Created by Dorin Danciu on 3/15/19.
//  Copyright © 2019 Beilmo. All rights reserved.
//

import Foundation
import XCTest

protocol AlertAction {
    var title: String { get }
}

enum LocationPermission: String, AlertAction {
    case always = "Always Allow"
    case whileInUse = "Only While Using the App"
    case never = "Don’t Allow"

    var title: String {
        return rawValue
    }
}

enum NotificationsPermission: String, AlertAction {
    case allow = "Allow"
    case dontAllow = "Don't Allow"

    var title: String {
        return rawValue
    }
}

enum MichrophonePermission: String, AlertAction {
    case ok = "OK"
    case dontAllow = "Don't Allow"

    var title: String {
        return rawValue
    }
}

extension XCTestCase {
    func resolveAlertInterruption(_ description: String, title: String, action: AlertAction) {
        // https://developer.apple.com/documentation/xctest/xctestcase/1496273-adduiinterruptionmonitor
        _ = addUIInterruptionMonitor(withDescription: description, handler: { (alert) -> Bool in

            guard alert.labelContains(title) else {
                return false
            }

            guard alert.buttons[action.title].exists else {
                return false
            }

            let button = alert.buttons[action.title]
            button.tap()

            return true
        })
    }

    func resolveLocationPermission(_ action: LocationPermission) {
        let description = "Location Permissions"
        let titleSubstring = "to access your location?"

        resolveAlertInterruption(description, title: titleSubstring, action: action)
    }

    func resolveNotificationsPermission(_ action: NotificationsPermission) {
        let description = "Local Notifications"
        let titleSubstring = "Would Like to Send You Notifications"

        resolveAlertInterruption(description, title: titleSubstring, action: action)
    }

    func resolveMicrophonePermission(_ action: MichrophonePermission) {
        let description = "Microphone Access"
        let titleSubstring = "Would Like to Access the Microphone"

        resolveAlertInterruption(description, title: titleSubstring, action: action)
    }
}

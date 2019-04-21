//
//  Permissions.swift
//  DetestableMe
//
//  Created by Dorin Danciu on 4/21/19.
//  Copyright © 2019 Beilmo. All rights reserved.
//

import AVFoundation
import CoreLocation
import Foundation
import UserNotifications

struct Permissions {
    let locationManager: CLLocationManager

    func requestLocationAuthorization() {
        // Ask for Authorisation from the User.
        locationManager.requestAlwaysAuthorization()
    }

    func requestNotificationsAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { _, _ in }
    }

    func requestMicrophoneAuthorization() {
        AVAudioSession.sharedInstance().requestRecordPermission { (_: Bool) -> Void in }
    }
}

//
//  XCUIElement+Utils.swift
//  DetestableMeUITests
//
//  Created by Dorin Danciu on 3/15/19.
//  Copyright © 2019 Beilmo. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func labelContains(_ text: String) -> Bool {
        let predicate = NSPredicate(format: "label CONTAINS %@", text)
        return staticTexts.matching(predicate).firstMatch.exists
    }
}

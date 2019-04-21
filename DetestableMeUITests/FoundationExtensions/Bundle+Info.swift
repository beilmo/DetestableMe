//
//  Bundle+Info.swift
//  DetestableMeUITests
//
//  Created by Dorin Danciu on 3/15/19.
//  Copyright © 2019 Beilmo. All rights reserved.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}

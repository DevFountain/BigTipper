//
//  UserDefaults.swift
//  BigTipper
//
//  Created by Curtis Wilcox on 3/3/17.
//  Copyright © 2017 DevFountain LLC. All rights reserved.
//

import Foundation

let settings = UserDefaults.standard

class Settings {

    static var defaultTipPercent: Int {
        set {
            settings.set(newValue, forKey: "defaultTipPercent")
        }
        get {
            return settings.integer(forKey: "defaultTipPercent")
        }
    }

}


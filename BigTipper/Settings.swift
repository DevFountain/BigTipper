//
//  Settings.swift
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

    static var billAmount: String {
        set {
            settings.set(newValue, forKey: "billAmount")
        }
        get {
            return settings.object(forKey: "billAmount") as? String ?? ""
        }
    }

    static var dateLastUsed: Date! {
        set {
            settings.set(newValue, forKey: "dateLastUsed")
        }
        get {
            return settings.object(forKey: "dateLastUsed") as? Date
        }
    }

}


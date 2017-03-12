//
//  Tip.swift
//  BigTipper
//
//  Created by Curtis Wilcox on 3/3/17.
//  Copyright © 2017 DevFountain LLC. All rights reserved.
//

import Foundation

struct Tip {

    let title: String
    let value: Double

    static var titles = [String]()
    static var percentages = [Tip]()

    static func getPercentages() {
        let fifteen = Tip(title: "15%", value: 0.15)
        Tip.percentages.append(fifteen)
        Tip.titles.append(fifteen.title)

        let twenty = Tip(title: "20%", value: 0.20)
        Tip.percentages.append(twenty)
        Tip.titles.append(twenty.title)

        let twentyFive = Tip(title: "25%", value: 0.25)
        Tip.percentages.append(twentyFive)
        Tip.titles.append(twentyFive.title)
    }

}


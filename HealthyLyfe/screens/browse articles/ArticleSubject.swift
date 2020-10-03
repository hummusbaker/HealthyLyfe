//
//  ArticleSubject.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/1/20.
//

import UIKit

enum ArticleSubject: String, CaseIterable {
    case vegan
    case meditation
    case exercise
    case therapy
}

extension ArticleSubject {

    var color: UIColor {
        switch self {
        case .vegan:
            return .appGreen
        case .meditation:
            return .appBlue
        case .therapy:
            return .appOrange
        case .exercise:
            return .appTeal
        }
    }
}

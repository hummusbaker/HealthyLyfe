//
//  UIColor+HealthyLyfe.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

extension UIColor {

    static var appBlue: UIColor {
        UIColor(named: "appBlue") ?? .blue
    }

    static var appGreen: UIColor {
        UIColor(named: "appGreen") ?? .green
    }

    static var appOrange: UIColor {
        UIColor(named: "appOrange") ?? .orange
    }

    static var appRed: UIColor {
        UIColor(named: "appRed") ?? .red
    }

    static var appTeal: UIColor {
        UIColor(named: "appTeal") ?? .purple
    }

    static var appBackground: UIColor {
        UIColor(named: "pageBackground") ?? .white
    }
}

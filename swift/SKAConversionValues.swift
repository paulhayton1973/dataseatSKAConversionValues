//
//  SKAConversionValues.swift
//  flappyjoust
//
//  Created by Paul Hayton on 01/02/2021.
//

import Foundation

class SKAConversionValues: NSObject {

    static func registerAppOpen() {
        if #available(iOS 14.0, *) {
            let defaults = UserDefaults.standard
            let currentValue = defaults.integer(forKey: "SKAConversionValue")
            if (currentValue == 0) {
                var cal = Calendar(identifier: .gregorian)
                cal.timeZone = TimeZone(identifier: "UTC")!
                let dateComponents = cal.dateComponents([.weekday], from: Date())
                let weekDay = dateComponents.weekday!
                SKAdNetwork.updateConversionValue(weekDay & 0x07)
                defaults.setValue(weekDay, forKey: "SKAConversionValue")
                defaults.synchronize()
            }
        }
    }
    
    static func updateConversionValue(value : Int) {
        if #available(iOS 14.0, *) {
            let upper3bits = (value & 0x07) << 3
            let defaults = UserDefaults.standard
            let currentValue = defaults.integer(forKey: "SKAConversionValue")
            let lower3bits = currentValue & 0x07
            
            let newValue = upper3bits | lower3bits
            if (newValue > currentValue) {
                SKAdNetwork.updateConversionValue(newValue)
                defaults.setValue(newValue, forKey: "SKAConversionValue")
                defaults.synchronize()
            }
        }
    }
}

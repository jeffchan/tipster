//
//  Utils.swift
//  tips
//
//  Created by Jeff Chan on 8/17/14.
//  Copyright (c) 2014 Jeff Chan. All rights reserved.
//

import Foundation

let defaults = NSUserDefaults.standardUserDefaults()

// Overloading for Int's
func getPersistedKey(key: String) -> Int {
    return defaults.integerForKey(key)
}

func setPersistedKey(key: String, value: Int) {
    defaults.setInteger(value, forKey: key)
    defaults.synchronize()
}

// Overloading for Double's
func getPersistedKey(key: String) -> Double {
    return defaults.doubleForKey(key)
}

func setPersistedKey(key: String, value: Double) {
    defaults.setDouble(value, forKey: key)
    defaults.synchronize()
}

func clearPersistedKey(key: String) {
    defaults.removeObjectForKey(key)
}
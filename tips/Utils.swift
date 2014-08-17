//
//  Utils.swift
//  tips
//
//  Created by Jeff Chan on 8/17/14.
//  Copyright (c) 2014 Jeff Chan. All rights reserved.
//

import Foundation

let DefaultIndexKey = "defaultIndex"

func getTipsControlDefaultIndex() -> NSInteger {
    var defaults = NSUserDefaults.standardUserDefaults()
    return defaults.integerForKey(DefaultIndexKey)
}

func setTipsControlDefaultIndex(index: NSInteger) {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(index, forKey: DefaultIndexKey)
    defaults.synchronize()
}
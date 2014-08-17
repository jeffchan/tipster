//
//  CalculatorModel.swift
//  tips
//
//  Created by Jeff Chan on 8/17/14.
//  Copyright (c) 2014 Jeff Chan. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    let expirationTime = 60 * 5.0 // in seconds
    
    // Persistance keys
    let defaultIndexKey = "Tipster:defaultIndexKey"
    let lastActiveKey = "Tipster:lastActiveKey"
    let billAmountKey = "Tipster:billAmountKey"
    
    var tipsControlDefaultIndex: Int {
        get {
            return getPersistedKey(defaultIndexKey)
        }
        set (index) {
            setPersistedKey(defaultIndexKey, index)
        }
    }
    
    var lastActive: Double {
        get {
            let lastActive: Double = getPersistedKey(lastActiveKey)
            
            if lastActive == nil {
                return CFAbsoluteTimeGetCurrent()
            }
            
            return lastActive
        }
        set (lastActive) {
            setPersistedKey(lastActiveKey, lastActive)
        }
    }
    
    var billAmount: Double {
        get {
            return getPersistedKey(billAmountKey)
        }
        set (amount) {
            setPersistedKey(billAmountKey, amount)
        }
    }
    
    func isLastActiveExpired(curTime: Double) -> Bool {
        return (curTime - lastActive) > expirationTime
    }
    
    func clearBillAmount() {
        clearPersistedKey(billAmountKey)
    }
    
    func maybeClearBillAmount() {
        if (isLastActiveExpired(CFAbsoluteTimeGetCurrent())) {
            clearBillAmount()
        }
    }
    
}
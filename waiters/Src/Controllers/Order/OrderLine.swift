//
//  SubOrderLine.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 02/08/2023.
//

import Foundation

class OrderLine: Identifiable {
    private var _item: MenuItem
    private var _amount: Int
    private var _timeStamp = Date()
    
    init(item: MenuItem, amount: Int) {
        self._item = item
        self._amount = amount
    }
    
    var item: MenuItem {
        get {
            return _item
        }
        set {
            _item = newValue
        }
    }
    
    var amount: Int {
        get {
            return _amount
        }
        set {
            _amount = newValue
        }
    }
    
    var timeStamp: Date {
        return _timeStamp
    }
}

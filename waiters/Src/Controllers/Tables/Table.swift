//
//  Table.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 22/07/2023.
//

import Foundation

class Table: Equatable, Identifiable {
    
    private var _tableNumber: Int
    private var _capacity: Int
    private var _isReserved: Bool
    private var _isByWindow: Bool
    private var _status: TableStatus
    
    private var connectedOrder = Order()
    
    init(tableNumber: Int, capacity: Int, isReserved: Bool, isByWindow: Bool, status: TableStatus = .available) {
        self._tableNumber = tableNumber
        self._capacity = capacity
        self._isReserved = isReserved
        self._isByWindow = isByWindow
        self._status = status
    }
    
    func getConnectedOrder() -> Order {
        return self.connectedOrder
    }
    
    func addOrderLine(line: OrderLine) {
        self.connectedOrder.addOrderLine(line: line)
    }
    
    func addOrderLine(lines: [OrderLine]) {
        self.connectedOrder.addOrderLine(lines: lines)
    }
    
    var status: TableStatus {
        get {
            return _status
        }
        set {
            _status = newValue
        }
    }
    
    var tableNumber: Int {
        get {
            return _tableNumber
        }
        set {
            _tableNumber = newValue
        }
    }
    
    var capacity: Int {
        get {
            return _capacity
        }
        set {
            _capacity = newValue
        }
    }
    
    var isReserved: Bool {
        get {
            return _isReserved
        }
        set {
            _isReserved = newValue
        }
    }
    
    var isByWindow: Bool {
        get {
            return _isReserved
        }
        set {
            _isReserved = newValue
        }
    }
    
    static func == (lhs: Table, rhs: Table) -> Bool {
        return lhs._tableNumber == rhs._tableNumber &&
               lhs._capacity == rhs._capacity &&
               lhs._isReserved == rhs._isReserved &&
               lhs._isByWindow == rhs._isByWindow &&
               lhs._status == rhs._status
    }
}

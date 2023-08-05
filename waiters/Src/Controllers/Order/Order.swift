//
//  Order.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 02/08/2023.
//

import Foundation

class Order {
    private var _orderLines: [OrderLine]
    
    init(orderLines: [OrderLine]) {
        self._orderLines = orderLines
    }
    
    init() {
        self._orderLines = []
    }
    
    var orderLines: [OrderLine] {
        return self._orderLines
    }
    
    func hasAnyOrders() -> Bool {
        return _orderLines.count != 0
    }
    
    func addOrderLine(line: OrderLine) {
        _orderLines.append(line)
    }
    
    func addOrderLine(lines: [OrderLine]) {
        for line in lines {
            _orderLines.append(line)
        }
    }
}

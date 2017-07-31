//
//  Rule.swift
//  PocketMole
//
//  Created by DianQK on 2017/7/31.
//  Copyright © 2017年 dianqk. All rights reserved.
//

import Foundation

struct Rule {
    let index1: Int
    let index2: Int
    let index3: Int
    
    let result: (_ value1: Int, _ value2: Int, _ value3: Int) -> Int
}

let rules: [Rule] = {
    var rules: [Rule] = []
    rules.append(Rule(index1: 0, index2: 1, index3: 6, result: { $0 + $1 + $2 }))
    rules.append(Rule(index1: 1, index2: 8, index3: 2, result: { $0 + $1 ^ 2 + $2 * 2 }))
    rules.append(Rule(index1: 2, index2: 0, index3: 6, result: { $0 * $1 + ($1 - $2) }))
    rules.append(Rule(index1: 3, index2: 1, index3: 8, result: { $0 - $1 - $2 }))
    rules.append(Rule(index1: 4, index2: 8, index3: 0, result: { $1 ^ $1 + $2 * 2 + $0^2 }))
    rules.append(Rule(index1: 5, index2: 9, index3: 3, result: { $1 ^ $1 + $2 * 2 - $0^2 }))
    rules.append(Rule(index1: 6, index2: 8, index3: 9, result: { $0 + $1 ^ $1 + $2 * 2 }))
    rules.append(Rule(index1: 7, index2: 1, index3: 6, result: { $0 + $1 + $2 }))
    rules.append(Rule(index1: 8, index2: 1, index3: 6, result: { $0 + $1 ^ $1 + $2 * 3 }))
    rules.append(Rule(index1: 9, index2: 2, index3: 5, result: { $0 - $1 ^ 3 - $2 * 2 }))
    return rules
}()

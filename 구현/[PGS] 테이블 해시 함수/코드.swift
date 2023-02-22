//
//  테이블 해시 함수.swift
//  Programmers
//  https://school.programmers.co.kr/learn/courses/30/lessons/147354
//  Created by DongKyu Kim on 2023/02/14.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ rowBegin:Int, _ rowEnd:Int) -> Int {
    var rowCurrent = rowBegin
    var dataArray = data.sorted { ($0[col-1], -$0[0]) < ($1[col-1], -$1[0]) }
    
    var result: Int = 0
    
    while rowCurrent <= rowEnd {
        var sCurrent = dataArray[rowCurrent-1].map { $0 % rowCurrent }.reduce(0, +)
        
        result = (rowCurrent == rowBegin) ? sCurrent : result ^ sCurrent
        
        rowCurrent += 1
    }
    
    return result
}

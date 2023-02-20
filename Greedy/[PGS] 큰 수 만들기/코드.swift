//
//  programmers 
//  level2_타겟 넘버.swift
//  Created by ryuwon on 2023/02/17
//  

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let map = number.map{String($0)}
    var stack = [String]()
    var cnt = 0
    
    for i in 0..<number.count {
        while cnt < k && !stack.isEmpty && stack.last! < map[i] {
            stack.removeLast()
            cnt += 1
        }
        if cnt >= k {
            stack.append(contentsOf: map[i...])
            break
        } else {
            stack.append(map[i])
        }
    }
    
    return String(stack.joined().prefix(number.count - k))
}
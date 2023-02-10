//
//  programmers 
//  level2_타겟 넘버.swift
//  Created by ryuwon on 2023/02/10.
//  

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ depth: Int, _ sum: Int){
        if depth == numbers.count{
            if target == sum {
                count += 1
            }
            return
        }
        
        dfs(depth + 1, sum + numbers[depth])
        dfs(depth + 1, sum - numbers[depth])
    }
    
    dfs(0, 0)
    
    return count
}
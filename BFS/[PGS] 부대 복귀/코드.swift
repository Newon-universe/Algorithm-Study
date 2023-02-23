//
//  부대 복귀.swift
//  Programmers
//  https://school.programmers.co.kr/learn/courses/30/lessons/132266
//  Created by DongKyu Kim on 2023/02/23.
//

import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var linkArray: [[Int]] = Array(repeating: [], count: n)
    var result: [Int] = []

    for road in roads {
        linkArray[road[0]-1].append(road[1])
        linkArray[road[1]-1].append(road[0])
    }

    let returnDict = bfs(destination, linkArray)

    sources.forEach { result.append(returnDict[$0] == nil ? -1 : returnDict[$0]!) }

    return result
}

func bfs(_ destination: Int, _ linkArray: [[Int]]) -> [Int: Int] {
    var length: [Int: Int] = [destination: 0]

    var queue = Queue<Int>()
    queue.append(destination)

    print(queue)
    while !queue.isEmpty {

        let current = queue.removeFirst()!

        for next in linkArray[current-1] {
            if length[next] == nil {
                length[next] = length[current]! + 1
                queue.append(next)
            }
        }
    }
    return length
}



class Queue<T> {
    var array: [T?]
    var head = 0

    var isEmpty: Bool {
        return count == 0
    }

    var count: Int {
        return array.count - head
    }

    var first: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }

    var last: T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }

    init(_ array: [T?] = [T?]()) {
        self.array = array
    }

    func append(_ element: T) {
        self.array.append(element)
    }

    func removeFirst() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        array[head] = nil
        head += 1

        return element
    }

    func removeLast() -> T? {
        return array.removeLast()
    }
}

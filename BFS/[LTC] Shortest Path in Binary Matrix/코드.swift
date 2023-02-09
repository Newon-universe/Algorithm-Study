//
//  1091. Shortest Path in Binary Matrix.swift
//  Programmers
//  https://leetcode.com/problems/shortest-path-in-binary-matrix/description/
//  Created by DongKyu Kim on 2023/02/09.
//

import Foundation

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var vGrid = grid
        let direction = [(-1, -1), (0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0)]
        let size = grid.count
        var length = 1

        var queue: [(Int, Int)] = [(0, 0)]

        while !queue.isEmpty {

            for _ in 0..<queue.count {
                let (x, y) = queue.removeFirst()
                if vGrid[x][y] == 1 { continue }
                if x == size-1 && y == size-1 { return length }
                vGrid[x][y] = 1

                for (dx, dy) in direction {
                    let (newX, newY) = (x+dx, y+dy)

                    if newX < 0 || newX >= size || newY < 0 || newY >= size { continue }
                    if vGrid[newX][newY] == 0 {
                        queue.append((newX, newY))
                    }
                }
            }
            length += 1
        }
        return -1
    }
}



/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 *
 * https://leetcode-cn.com/problems/number-of-islands/description/
 *
 * algorithms
 * Medium (45.39%)
 * Likes:    242
 * Dislikes: 0
 * Total Accepted:    29.8K
 * Total Submissions: 65.6K
 * Testcase Example:  '[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]'
 *
 * 给定一个由 '1'（陆地）和
 * '0'（水）组成的的二维网格，计算岛屿的数量。一个岛被水包围，并且它是通过水平方向或垂直方向上相邻的陆地连接而成的。你可以假设网格的四个边均被水包围。
 *
 * 示例 1:
 *
 * 输入:
 * 11110
 * 11010
 * 11000
 * 00000
 *
 * 输出: 1
 *
 *
 * 示例 2:
 *
 * 输入:
 * 11000
 * 11000
 * 00100
 * 00011
 *
 * 输出: 3
 *
 *
 */
class Solution {

    var uf: [Int] = []
    var count = 0
    var m = 0

    func find(_ node: Int) -> Int {
        var node = node
        while uf[node] != node {
            uf[node] = uf[uf[node]]
            node = uf[node]
        }
        return node
    }

    func union(_ n1: Int, _ n2: Int) {
        let f1 = find(n1)
        let f2 = find(n2)
        if f1 != f2 {
            uf[f2] = f1
            count -= 1
        }
    }

    func node(_ i: Int, _ j: Int) -> Int {
        return i * m + j
    }

    func numIslands(_ grid: [[Character]]) -> Int {

        if grid.isEmpty { return 0 }

        let n = grid.count
        m = grid[0].count

        let fuck = n * m + 1

        count = fuck

        for i in 0..<count{
            uf.append(i)
        }

        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == "0" {
                    union(node(i, j), fuck - 1)
                } else {
                    if i + 1 < n, grid[i+1][j] == "1" {
                        union(node(i, j), node(i+1, j))
                    }
                    if j + 1 < m, grid[i][j+1] == "1" {
                        union(node(i, j), node(i, j+1))
                    }
                }
            }
        }

        return count - 1
    }
}
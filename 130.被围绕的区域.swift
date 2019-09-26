/*
 * @lc app=leetcode.cn id=130 lang=swift
 *
 * [130] 被围绕的区域
 *
 * https://leetcode-cn.com/problems/surrounded-regions/description/
 *
 * algorithms
 * Medium (38.03%)
 * Likes:    104
 * Dislikes: 0
 * Total Accepted:    10.8K
 * Total Submissions: 28.4K
 * Testcase Example:  '[["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]'
 *
 * 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
 * 
 * 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
 * 
 * 示例:
 * 
 * X X X X
 * X O O X
 * X X O X
 * X O X X
 * 
 * 
 * 运行你的函数后，矩阵变为：
 * 
 * X X X X
 * X X X X
 * X X X X
 * X O X X
 * 
 * 
 * 解释:
 * 
 * 被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O'
 * 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
 * 
 */
class Solution {

    var uf: [Int]!
    var n: Int!
    var m: Int!

    func union(_ n1: Int, _ n2: Int) {
        uf[find(n2)] = find(n1)
    }

    func find(_ node: Int) -> Int {
        var node = node 

        while uf[node] != node {
            uf[node] = uf[uf[node]]
            node = uf[node]
        }

        return node
    }

    func isConected(_ n1: Int, _ n2: Int) -> Bool {
        return find(n1) == find(n2)
    }

    func node(_ i: Int, _ j: Int) -> Int {
        return i * m + j
    }

    func solve(_ board: inout [[Character]]) {
        
        if board.isEmpty { return }

        n = board.count
        m = board[0].count 
        let last = n * m
        uf = Array(repeating: -1, count: last + 1)

        for i in 0...last {
            uf[i] = i
        }

        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "O" {
                    if i == 0 || j == 0 || i == n - 1 || j == m - 1 {
                        union(last, node(i, j))
                    } else {
                        if board[i-1][j] == "O" { union(node(i-1, j), node(i, j)) }
                        if board[i][j-1] == "O" { union(node(i, j-1), node(i, j)) }
                        if board[i][j+1] == "O" { union(node(i, j+1), node(i, j)) }
                        if board[i+1][j] == "O" { union(node(i+1, j), node(i, j)) }
                    }
                }
            }
        }

        for i in 0..<n {
            for j in 0..<m {
                if isConected(node(i, j), last) {
                    board[i][j] = "O"
                } else {
                    board[i][j] = "X"
                }
            }
        }
    }
}


/*
 * @lc app=leetcode.cn id=221 lang=swift
 *
 * [221] 最大正方形
 *
 * https://leetcode-cn.com/problems/maximal-square/description/
 *
 * algorithms
 * Medium (38.17%)
 * Likes:    130
 * Dislikes: 0
 * Total Accepted:    11.1K
 * Total Submissions: 29.1K
 * Testcase Example:  '[["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]'
 *
 * 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
 * 
 * 示例:
 * 
 * 输入: 
 * 
 * 1 0 1 0 0
 * 1 0 1 1 1
 * 1 1 1 1 1
 * 1 0 0 1 0
 * 
 * 输出: 4
 * 
 */
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        
        if matrix.isEmpty { return 0 }
        
        let m = matrix.count
        let n = matrix[0].count

        var previousRows = Array(repeating: 0, count: n + 1)
        var currentRows = previousRows

        var res = 0

        for i in 0..<m {
            for j in 1...n {
                if matrix[i][j-1] == "0" {
                    currentRows[j] = 0
                } else {
                    currentRows[j] = min(currentRows[j-1], previousRows[j])
                    currentRows[j] = min(currentRows[j], previousRows[j-1])
                    currentRows[j] += 1
                }
                res = max(res, currentRows[j])
            }

            previousRows = currentRows
        }

        return res * res
    }
}


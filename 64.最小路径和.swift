/*
 * @lc app=leetcode.cn id=64 lang=swift
 *
 * [64] 最小路径和
 *
 * https://leetcode-cn.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (62.25%)
 * Likes:    274
 * Dislikes: 0
 * Total Accepted:    31K
 * Total Submissions: 49.7K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 * 
 * 说明：每次只能向下或者向右移动一步。
 * 
 * 示例:
 * 
 * 输入:
 * [
 * [1,3,1],
 * ⁠ [1,5,1],
 * ⁠ [4,2,1]
 * ]
 * 输出: 7
 * 解释: 因为路径 1→3→1→1→1 的总和最小。
 * 
 * 
 */
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {

        guard !grid.isEmpty else { return 0 }

        let m = grid.count
        let n = grid[0].count

        var previousRows: [Int] = grid[0]
        var currentRows: [Int] = previousRows

        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    currentRows[0] = grid[0][0]
                } else if i == 0 {
                    currentRows[j] = currentRows[j-1] + grid[0][j]
                } else if j == 0 {
                    currentRows[0] = previousRows[0] + grid[i][0]
                } else {
                    currentRows[j] = min(currentRows[j-1], previousRows[j]) + grid[i][j]
                }
            }
    
            previousRows = currentRows
        }

        return currentRows.last!
    }
}


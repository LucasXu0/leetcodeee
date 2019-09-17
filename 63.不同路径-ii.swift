/*
 * @lc app=leetcode.cn id=63 lang=swift
 *
 * [63] 不同路径 II
 *
 * https://leetcode-cn.com/problems/unique-paths-ii/description/
 *
 * algorithms
 * Medium (31.71%)
 * Likes:    157
 * Dislikes: 0
 * Total Accepted:    22K
 * Total Submissions: 69.2K
 * Testcase Example:  '[[0,0,0],[0,1,0],[0,0,0]]'
 *
 * 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 * 
 * 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 * 
 * 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 * 
 * 
 * 
 * 网格中的障碍物和空位置分别用 1 和 0 来表示。
 * 
 * 说明：m 和 n 的值均不超过 100。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * [0,0,0],
 * [0,1,0],
 * [0,0,0]
 * ]
 * 输出: 2
 * 解释:
 * 3x3 网格的正中间有一个障碍物。
 * 从左上角到右下角一共有 2 条不同的路径：
 * 1. 向右 -> 向右 -> 向下 -> 向下
 * 2. 向下 -> 向下 -> 向右 -> 向右
 * 
 * 
 */
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        if obstacleGrid.isEmpty { return 0 }

        let m = obstacleGrid.count
        let n = obstacleGrid[0].count

        var previousRows = Array(repeating: 0, count: n+1)
        var currentRows = previousRows

        previousRows[1] = 1

        for i in 1...m {

            for j in 1...n {
                if obstacleGrid[i-1][j-1] == 1 {
                    currentRows[j] = 0
                } else {
                    currentRows[j] = previousRows[j] + currentRows[j-1]
                }
            }

            previousRows = currentRows
        }

        return currentRows.last!
    }

    private func dp(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty { return 0 }

        let m = obstacleGrid.count
        let n = obstacleGrid[0].count

        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)

        for i in 1...m {
            for j in 1...n {
                
                if obstacleGrid[i-1][j-1] == 1 {
                    dp[i][j] = 0
                } else if i == 1 && j == 1 {
                    if obstacleGrid[i-1][j-1] == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = 0
                    }
                } else {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }

        return dp.last!.last!
    }
}


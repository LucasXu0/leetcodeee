/*
 * @lc app=leetcode.cn id=329 lang=swift
 *
 * [329] 矩阵中的最长递增路径
 *
 * https://leetcode-cn.com/problems/longest-increasing-path-in-a-matrix/description/
 *
 * algorithms
 * Hard (39.30%)
 * Likes:    79
 * Dislikes: 0
 * Total Accepted:    5.2K
 * Total Submissions: 13.2K
 * Testcase Example:  '[[9,9,4],[6,6,8],[2,1,1]]'
 *
 * 给定一个整数矩阵，找出最长递增路径的长度。
 * 
 * 对于每个单元格，你可以往上，下，左，右四个方向移动。 你不能在对角线方向上移动或移动到边界外（即不允许环绕）。
 * 
 * 示例 1:
 * 
 * 输入: nums = 
 * [
 * ⁠ [9,9,4],
 * ⁠ [6,6,8],
 * ⁠ [2,1,1]
 * ] 
 * 输出: 4 
 * 解释: 最长递增路径为 [1, 2, 6, 9]。
 * 
 * 示例 2:
 * 
 * 输入: nums = 
 * [
 * ⁠ [3,4,5],
 * ⁠ [3,2,6],
 * ⁠ [2,2,1]
 * ] 
 * 输出: 4 
 * 解释: 最长递增路径是 [3, 4, 5, 6]。注意不允许在对角线方向上移动。
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        
        if matrix.isEmpty { return 0 }

        let n = matrix.count
        let m = matrix[0].count

        let empty = Array(repeating: 0, count: m)
        var cache: [[Int]] = Array(repeating: empty, count: n)
        
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]

        func dfs(_ matrix: [[Int]], _ i: Int, _ j: Int) -> Int {

            if cache[i][j] != 0 { return cache[i][j] }

            for k in 0..<4 {
                let x = i + dx[k]
                let y = j + dy[k]

                if x >= 0 && x < n && y >= 0 && y < m && matrix[x][y] > matrix[i][j] {
                    cache[i][j] = max(cache[i][j], dfs(matrix, x, y))
                }
            }

            cache[i][j] += 1

            return cache[i][j]
        }

        var count = 0 
        for i in 0..<n {
            for j in 0..<m {
                count = max(count, dfs(matrix, i, j))
            }
        }

        return count
    }
}
// @lc code=end


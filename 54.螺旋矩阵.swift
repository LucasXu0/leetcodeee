/*
 * @lc app=leetcode.cn id=54 lang=swift
 *
 * [54] 螺旋矩阵
 *
 * https://leetcode-cn.com/problems/spiral-matrix/description/
 *
 * algorithms
 * Medium (36.97%)
 * Likes:    198
 * Dislikes: 0
 * Total Accepted:    21.5K
 * Total Submissions: 58.1K
 * Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
 *
 * 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 4, 5, 6 ],
 * ⁠[ 7, 8, 9 ]
 * ]
 * 输出: [1,2,3,6,9,8,7,4,5]
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * [
 * ⁠ [1, 2, 3, 4],
 * ⁠ [5, 6, 7, 8],
 * ⁠ [9,10,11,12]
 * ]
 * 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 * 
 * 
 */
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 思路来自于 https://leetcode.com/problems/spiral-matrix/discuss/20599/Super-Simple-and-Easy-to-Understand-Solution

        var res: [Int] = []

        guard !matrix.isEmpty else { return res }

        var startRow = 0
        var endRow = matrix.count - 1

        var startColumn = 0
        var endColumm = matrix[0].count - 1

        while startColumn <= endColumm, startRow <= endRow {
            // from left to right 
            for i in startColumn..<endColumm + 1 {
                res.append(matrix[startRow][i])
            }
            startRow += 1

            // from top to bottom
            for i in startRow..<endRow + 1 {
                res.append(matrix[i][endColumm])
            }
            endColumm -= 1

            // from right to left
            if startColumn <= endColumm && startRow <= endRow {
                for i in (startColumn..<endColumm+1).reversed() {
                    res.append(matrix[endRow][i])
                }
                endRow -= 1
            }

            // from bottom to top
            if startColumn <= endColumm && startRow <= endRow {
                for i in (startRow..<endRow+1).reversed() {
                    res.append(matrix[i][startColumn])
                }
                startColumn += 1
            }
        }

        return res
    }
}


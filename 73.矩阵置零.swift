/*
 * @lc app=leetcode.cn id=73 lang=swift
 *
 * [73] 矩阵置零
 *
 * https://leetcode-cn.com/problems/set-matrix-zeroes/description/
 *
 * algorithms
 * Medium (53.88%)
 * Likes:    125
 * Dislikes: 0
 * Total Accepted:    16.9K
 * Total Submissions: 31.5K
 * Testcase Example:  '[[1,1,1],[1,0,1],[1,1,1]]'
 *
 * 给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
 * 
 * 示例 1:
 * 
 * 输入: 
 * [
 * [1,1,1],
 * [1,0,1],
 * [1,1,1]
 * ]
 * 输出: 
 * [
 * [1,0,1],
 * [0,0,0],
 * [1,0,1]
 * ]
 * 
 * 
 * 示例 2:
 * 
 * 输入: 
 * [
 * [0,1,2,0],
 * [3,4,5,2],
 * [1,3,1,5]
 * ]
 * 输出: 
 * [
 * [0,0,0,0],
 * [0,4,5,0],
 * [0,3,1,0]
 * ]
 * 
 * 进阶:
 * 
 * 
 * 一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 * 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 * 你能想出一个常数空间的解决方案吗？
 * 
 * 
 */
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {

        guard !matrix.isEmpty else { return }

        // O(m + n)
        // use Array[m] record that column need set zero 
        // use Array[n] record that row need set zero 

        let n = matrix.count
        let m = matrix[0].count

        var zeroRows = Array(repeating: 1, count: n)
        var zeroColumns = Array(repeating: 1, count: m)

        for i in 0..<n {
            for j in 0..<m {
                if matrix[i][j] == 0 {
                    zeroRows[i] = 0
                    zeroColumns[j] = 0
                }
            }
        }

        for i in 0..<n {
            if zeroRows[i] == 0 {
                for j in 0..<m {
                    matrix[i][j] = 0
                }
            }
        }

        for j in 0..<m {
            if zeroColumns[j] == 0 {
                for i in 0..<n {
                    matrix[i][j] = 0
                }
            }
        }
    }
}


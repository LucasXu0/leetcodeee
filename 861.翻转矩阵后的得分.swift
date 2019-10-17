/*
 * @lc app=leetcode.cn id=861 lang=swift
 *
 * [861] 翻转矩阵后的得分
 *
 * https://leetcode-cn.com/problems/score-after-flipping-matrix/description/
 *
 * algorithms
 * Medium (71.49%)
 * Likes:    39
 * Dislikes: 0
 * Total Accepted:    2.8K
 * Total Submissions: 3.8K
 * Testcase Example:  '[[0,0,1,1],[1,0,1,0],[1,1,0,0]]'
 *
 * 有一个二维矩阵 A 其中每个元素的值为 0 或 1 。
 * 
 * 移动是指选择任一行或列，并转换该行或列中的每一个值：将所有 0 都更改为 1，将所有 1 都更改为 0。
 * 
 * 在做出任意次数的移动后，将该矩阵的每一行都按照二进制数来解释，矩阵的得分就是这些数字的总和。
 * 
 * 返回尽可能高的分数。
 * 
 * 
 * 
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：[[0,0,1,1],[1,0,1,0],[1,1,0,0]]
 * 输出：39
 * 解释：
 * 转换为 [[1,1,1,1],[1,0,0,1],[1,1,1,1]]
 * 0b1111 + 0b1001 + 0b1111 = 15 + 9 + 15 = 39
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= A.length <= 20
 * 1 <= A[0].length <= 20
 * A[i][j] 是 0 或 1
 * 
 * 
 */

// @lc code=start
class Solution {
    func matrixScore(_ matrix: [[Int]]) -> Int {
        var matrix = matrix

        let n = matrix.count 
        let m = matrix[0].count

        for i in 0..<n {
            
            var one = 0
            
            if matrix[i][0] != 1 {
                for j in 0..<m {
                    matrix[i][j] = reverse(matrix[i][j])
                }
            }
        }

        for j in 0..<m {
            var one_cnt = 0
            var zero_cnt = 0
            for i in 0..<n {
                if matrix[i][j] == 1 {
                    one_cnt += 1
                } else {
                    zero_cnt += 1
                }
            }
            if one_cnt < zero_cnt {
                for i in 0..<n {
                    matrix[i][j] = reverse(matrix[i][j])
                }
            }
        }

        var res = 0

        for i in 0..<n {
            let s = String(matrix[i].map({ Character("\($0)") }))
            res += binary2dec(s)
        }
        
        return res
    }

    func binary2dec(_ num: String) -> Int {
        var sum = 0
        for c in num {
            sum = sum * 2 + Int("\(c)")!
        }
        return sum
    }

    private func reverse(_ i: Int) -> Int {
        if i == 0 { return 1 }
        return 0
    }
}
// @lc code=end


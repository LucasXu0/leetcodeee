/*
 * @lc app=leetcode.cn id=118 lang=swift
 *
 * [118] 杨辉三角
 *
 * https://leetcode-cn.com/problems/pascals-triangle/description/
 *
 * algorithms
 * Easy (63.70%)
 * Likes:    183
 * Dislikes: 0
 * Total Accepted:    34.6K
 * Total Submissions: 54.3K
 * Testcase Example:  '5'
 *
 * 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 * 
 * 
 * 
 * 在杨辉三角中，每个数是它左上方和右上方的数的和。
 * 
 * 示例:
 * 
 * 输入: 5
 * 输出:
 * [
 * ⁠    [1],
 * ⁠   [1,1],
 * ⁠  [1,2,1],
 * ⁠ [1,3,3,1],
 * ⁠[1,4,6,4,1]
 * ]
 * 
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        var res: [[Int]] = []

        guard numRows > 0 else { return res }

        for i in 1...numRows {
            var tmp: [Int] = []
            for j in 0..<i {
                if j == 0 || j == i - 1 { // first index & last index are lack of top-left
                    tmp.append(1)
                } else {
                    tmp.append(res[i-2][j-1]+res[i-2][j])
                }
            }
            res.append(tmp)
        }

        return res
    }
}


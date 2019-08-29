/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 *
 * https://leetcode-cn.com/problems/subsets/description/
 *
 * algorithms
 * Medium (74.68%)
 * Likes:    318
 * Dislikes: 0
 * Total Accepted:    33K
 * Total Submissions: 44.1K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 * 
 * 说明：解集不能包含重复的子集。
 * 
 * 示例:
 * 
 * 输入: nums = [1,2,3]
 * 输出:
 * [
 * ⁠ [3],
 * [1],
 * [2],
 * [1,2,3],
 * [1,3],
 * [2,3],
 * [1,2],
 * []
 * ]
 * 
 */
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        var res: [[Int]] = [[]]

        for num in nums {
            for i in 0..<res.count {
                var tmp = res[i]
                tmp.append(num)
                res.append(tmp)
            }
        }

        return res
    }
}


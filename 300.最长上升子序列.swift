/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长上升子序列
 *
 * https://leetcode-cn.com/problems/longest-increasing-subsequence/description/
 *
 * algorithms
 * Medium (43.23%)
 * Likes:    290
 * Dislikes: 0
 * Total Accepted:    27.9K
 * Total Submissions: 64.5K
 * Testcase Example:  '[10,9,2,5,3,7,101,18]'
 *
 * 给定一个无序的整数数组，找到其中最长上升子序列的长度。
 * 
 * 示例:
 * 
 * 输入: [10,9,2,5,3,7,101,18]
 * 输出: 4 
 * 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 * 
 * 说明:
 * 
 * 
 * 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 * 你算法的时间复杂度应该为 O(n^2) 。
 * 
 * 
 * 进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
 * 
 */
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {

        if nums.count < 2 { return nums.count }

        var dp = Array(repeating: 1, count: nums.count)

        var res = 1
        for i in 1..<nums.count {
            var maxLen = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    maxLen = max(maxLen, dp[j] + 1)
                }
            }
            dp[i] = maxLen
            res = max(res, dp[i])
        }

        return res
    }
}


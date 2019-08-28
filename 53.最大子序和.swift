/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子序和
 *
 * https://leetcode-cn.com/problems/maximum-subarray/description/
 *
 * algorithms
 * Easy (46.99%)
 * Likes:    1149
 * Dislikes: 0
 * Total Accepted:    85.8K
 * Total Submissions: 182.3K
 * Testcase Example:  '[-2,1,-3,4,-1,2,1,-5,4]'
 *
 * 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 * 
 * 示例:
 * 
 * 输入: [-2,1,-3,4,-1,2,1,-5,4],
 * 输出: 6
 * 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 * 
 * 
 * 进阶:
 * 
 * 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 * 
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        guard !nums.isEmpty else { return 0 }
        
        var sum = 0
        var maxSum = nums[0]
        
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }

            maxSum = max(sum, maxSum)
        }

        return maxSum
    }
}


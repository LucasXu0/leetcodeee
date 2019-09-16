/*
 * @lc app=leetcode.cn id=152 lang=swift
 *
 * [152] 乘积最大子序列
 *
 * https://leetcode-cn.com/problems/maximum-product-subarray/description/
 *
 * algorithms
 * Medium (35.21%)
 * Likes:    242
 * Dislikes: 0
 * Total Accepted:    17.8K
 * Total Submissions: 50.5K
 * Testcase Example:  '[2,3,-2,4]'
 *
 * 给定一个整数数组 nums ，找出一个序列中乘积最大的连续子序列（该序列至少包含一个数）。
 * 
 * 示例 1:
 * 
 * 输入: [2,3,-2,4]
 * 输出: 6
 * 解释: 子数组 [2,3] 有最大乘积 6。
 * 
 * 
 * 示例 2:
 * 
 * 输入: [-2,0,-1]
 * 输出: 0
 * 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 * 
 */
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {

        // dp
        return dp(nums)        

        var preMin = nums[0]
        var preMax = nums[0]
        var res = nums[0]

        for i in 1..<nums.count {
            let curMax = max(max(nums[i]*preMax, nums[i]*preMin), nums[i])
            let curMin = min(min(nums[i]*preMax, nums[i]*preMin), nums[i])
            
            res = max(curMax, res)

            preMax = curMax
            preMin = curMin
        }

        return res
    }

    private func dp(_ nums: [Int]) -> Int {
        
        // 由于存在负数, 所以要记录前面的最小值和最大值
        
        var preMax = 1
        var preMin = 1

        var maxNum = Int.min

        for num in nums {
            if num < 0 {
                swap(&preMax, &preMin)
            }

            preMax = max(preMax * num, num)
            preMin = min(preMin * num, num)

            maxNum = max(maxNum, preMax)
        }

        return maxNum
    }
}


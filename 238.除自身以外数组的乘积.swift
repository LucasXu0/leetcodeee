/*
 * @lc app=leetcode.cn id=238 lang=swift
 *
 * [238] 除自身以外数组的乘积
 *
 * https://leetcode-cn.com/problems/product-of-array-except-self/description/
 *
 * algorithms
 * Medium (62.52%)
 * Likes:    201
 * Dislikes: 0
 * Total Accepted:    15.8K
 * Total Submissions: 25.3K
 * Testcase Example:  '[1,2,3,4]'
 *
 * 给定长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i]
 * 之外其余各元素的乘积。
 * 
 * 示例:
 * 
 * 输入: [1,2,3,4]
 * 输出: [24,12,8,6]
 * 
 * 说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。
 * 
 * 进阶：
 * 你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）
 * 
 */
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {

        // O(1)
        var i = 1
        var j = nums.count - 2

        var res = Array(repeating: 1, count: nums.count)

        var leftProduct = 1
        var rightProduct = 1

        while i < nums.count {
            res[i-1] *= leftProduct
            res[j+1] *= rightProduct

            leftProduct *= nums[i-1]
            rightProduct *= nums[j+1]

            i += 1
            j -= 1
        }

        res[0] *= rightProduct
        res[res.count-1] *= leftProduct

        return res
    }

    // O(n) 空间
    private func _productExceptSelf(_ nums: [Int]) -> [Int] {
        var i = 1
        var j = nums.count - 2

        var leftProducts = Array(repeating: 1, count: nums.count)
        var rightProducts = Array(repeating: 1, count: nums.count)

        var res = Array(repeating: 1, count: nums.count)

        while i < nums.count + 1 {
            
            res[i-1] *= leftProducts[i-1]
            res[j+1] *= rightProducts[j+1]

            if i < nums.count {
                leftProducts[i] = nums[i-1] * leftProducts[i-1]
                rightProducts[j] = nums[j+1] * rightProducts[j+1]
            }

            i += 1
            j -= 1
        }
        
        return res
    }
}


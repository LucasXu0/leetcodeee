/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 *
 * https://leetcode-cn.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (56.22%)
 * Likes:    378
 * Dislikes: 0
 * Total Accepted:    64.3K
 * Total Submissions: 114.2K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,3,12]
 * 输出: [1,3,12,0,0]
 * 
 * 说明:
 * 
 * 
 * 必须在原数组上操作，不能拷贝额外的数组。
 * 尽量减少操作次数。
 * 
 * 
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroIndex = 0
        var nonZeroIndex = 0

        while nonZeroIndex < nums.count {
            if nums[nonZeroIndex] != 0 {
                let tmp = nums[nonZeroIndex]
                nums[nonZeroIndex] = nums[zeroIndex]
                nums[zeroIndex] = tmp

                zeroIndex += 1
            }
            nonZeroIndex += 1
        }
    }
}


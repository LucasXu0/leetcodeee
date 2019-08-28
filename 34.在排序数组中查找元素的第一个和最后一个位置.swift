/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 *
 * https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
 *
 * algorithms
 * Medium (37.53%)
 * Likes:    194
 * Dislikes: 0
 * Total Accepted:    30.5K
 * Total Submissions: 81.3K
 * Testcase Example:  '[5,7,7,8,8,10]\n8'
 *
 * 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 * 
 * 你的算法时间复杂度必须是 O(log n) 级别。
 * 
 * 如果数组中不存在目标值，返回 [-1, -1]。
 * 
 * 示例 1:
 * 
 * 输入: nums = [5,7,7,8,8,10], target = 8
 * 输出: [3,4]
 * 
 * 示例 2:
 * 
 * 输入: nums = [5,7,7,8,8,10], target = 6
 * 输出: [-1,-1]
 * 
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let left = searchBoader(nums, target, true)

        guard left != -1 else { return [-1, -1] }

        let right = searchBoader(nums, target, false)

        return [left, right]
    }

    private func searchBoader(_ nums: [Int], _ target: Int, _ forLeft: Bool) -> Int {
        var i = 0
        var j = nums.count - 1

        var hasFound = -1

        while i <= j {
            let mid = (j - i) / 2 + i

            if nums[mid] > target {
                j = mid - 1
            } else if nums[mid] < target {
                i = mid + 1
            } else {
                if forLeft {
                    j = mid - 1
                 } else {
                    i = mid + 1
                 }
                hasFound = mid
            }
        }

        return hasFound
    }
}


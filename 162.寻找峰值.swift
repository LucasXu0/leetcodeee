/*
 * @lc app=leetcode.cn id=162 lang=swift
 *
 * [162] 寻找峰值
 *
 * https://leetcode-cn.com/problems/find-peak-element/description/
 *
 * algorithms
 * Medium (41.63%)
 * Likes:    84
 * Dislikes: 0
 * Total Accepted:    16.1K
 * Total Submissions: 38.6K
 * Testcase Example:  '[1,2,3,1]'
 *
 * 峰值元素是指其值大于左右相邻值的元素。
 * 
 * 给定一个输入数组 nums，其中 nums[i] ≠ nums[i+1]，找到峰值元素并返回其索引。
 * 
 * 数组可能包含多个峰值，在这种情况下，返回任何一个峰值所在位置即可。
 * 
 * 你可以假设 nums[-1] = nums[n] = -∞。
 * 
 * 示例 1:
 * 
 * 输入: nums = [1,2,3,1]
 * 输出: 2
 * 解释: 3 是峰值元素，你的函数应该返回其索引 2。
 * 
 * 示例 2:
 * 
 * 输入: nums = [1,2,1,3,5,6,4]
 * 输出: 1 或 5 
 * 解释: 你的函数可以返回索引 1，其峰值元素为 2；
 * 或者返回索引 5， 其峰值元素为 6。
 * 
 * 
 * 说明:
 * 
 * 你的解法应该是 O(logN) 时间复杂度的。
 * 
 */
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        // O(n) 蛮力法
        // return bruteForce(nums)

        // 递归
        // return binarySearch_recursion(nums, 0, nums.count-1)

        // 非递归
        return binarySearch_non_recursion(nums, 0, nums.count-1)
    }

    private func binarySearch_non_recursion(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        var mid = 0

        while left < right {
            mid = (right - left) / 2 + left
            if nums[mid] > nums[mid+1] {
                right = mid // 降序说明峰值在左边，有可能是当前位置
            } else {
                left = mid + 1 // 升序说明峰值在右边，肯定不是当前位置
            }
        }

        return left
    }

    private func binarySearch_recursion(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        if left == right {
            return left
        }

        let mid = (right - left) / 2 + left
        if nums[mid] > nums[mid+1] { // 降序, 说明峰值在左边
            return binarySearch_recursion(nums, left, mid)
        } else { // 升序，说明峰值在右边
            return binarySearch_recursion(nums, mid+1, right)
        }
    }

    // O(n)
    private func bruteForce(_ nums: [Int]) -> Int {
        
        for i in 0..<nums.count-1 {
            if nums[i] > nums[i+1] {
                return i
            }
        }

        return nums.count - 1
    }
}


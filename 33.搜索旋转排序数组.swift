/*
 * @lc app=leetcode.cn id=33 lang=swift
 *
 * [33] 搜索旋转排序数组
 *
 * https://leetcode-cn.com/problems/search-in-rotated-sorted-array/description/
 *
 * algorithms
 * Medium (36.11%)
 * Likes:    337
 * Dislikes: 0
 * Total Accepted:    38.8K
 * Total Submissions: 107.4K
 * Testcase Example:  '[4,5,6,7,0,1,2]\n0'
 *
 * 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 * 
 * ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 * 
 * 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 * 
 * 你可以假设数组中不存在重复的元素。
 * 
 * 你的算法时间复杂度必须是 O(log n) 级别。
 * 
 * 示例 1:
 * 
 * 输入: nums = [4,5,6,7,0,1,2], target = 0
 * 输出: 4
 * 
 * 
 * 示例 2:
 * 
 * 输入: nums = [4,5,6,7,0,1,2], target = 3
 * 输出: -1
 * 
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 1. O(log n) -> binary search

        // twice binary search 
        // 1. find the key point that nums[i] > nums[i+1]
        // 2. judge target that is bigger than key point
        // yes -> find the element in nums[i+1...]
        // no -> find the element in nums[...i]

        var res = -1
        guard !nums.isEmpty else { return res }

        let rotatedPoint = findRotatedPoint(nums)

        // this array has not been rotated
        if rotatedPoint == -1 {
            res = binarySearch(nums, 0, nums.count - 1, target)
        } else {
            if target >= nums[0] {
                res = binarySearch(nums, 0, rotatedPoint, target)
            } else {
                res = binarySearch(nums, rotatedPoint + 1, nums.count - 1, target)
            }
        }

        return res
    }

    private func binarySearch(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        var i = start
        var j = end

        var res = -1

        while i <= j {
            let mid = (j - i) / 2 + i
            
            if nums[mid] > target {
                j = mid - 1
            } else if nums[mid] < target {
                i = mid + 1
            } else {
                res = mid
                break
            }
        }

        return res
    }

    private func findRotatedPoint(_ nums: [Int]) -> Int {
        var i = 0
        var j = nums.count - 1

        var keypoint = -1

        while i <= j {
            let mid = (j - i) / 2 + i

            if nums[mid] > nums[j] {
                if mid + 1 == j {
                    keypoint = mid
                    break
                } else {
                    i = mid
                }
            } else if nums[mid] < nums[i] {
                j = mid
            } else {
                break
            }
        }

        return keypoint
    }
}


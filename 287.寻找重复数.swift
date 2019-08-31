/*
 * @lc app=leetcode.cn id=287 lang=swift
 *
 * [287] 寻找重复数
 *
 * https://leetcode-cn.com/problems/find-the-duplicate-number/description/
 *
 * algorithms
 * Medium (60.68%)
 * Likes:    253
 * Dislikes: 0
 * Total Accepted:    18.2K
 * Total Submissions: 30K
 * Testcase Example:  '[1,3,4,2,2]'
 *
 * 给定一个包含 n + 1 个整数的数组 nums，其数字都在 1 到 n 之间（包括 1 和
 * n），可知至少存在一个重复的整数。假设只有一个重复的整数，找出这个重复的数。
 * 
 * 示例 1:
 * 
 * 输入: [1,3,4,2,2]
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,1,3,4,2]
 * 输出: 3
 * 
 * 
 * 说明：
 * 
 * 
 * 不能更改原数组（假设数组是只读的）。
 * 只能使用额外的 O(1) 的空间。
 * 时间复杂度小于 O(n^2) 。
 * 数组中只有一个重复的数字，但它可能不止重复出现一次。
 * 
 * 
 */
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        // return binarySearch(nums)
        return _findDuplicate(nums)
    }

    private func _findDuplicate(_ nums: [Int]) -> Int { 
        var slow = nums[0]
        var fast = nums[0]

        repeat {
            
            slow = nums[slow]
            fast = nums[nums[fast]]

        } while slow != fast

        fast = nums[0]

        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }

    // O(ologn)
    private func binarySearch(_ nums: [Int]) -> Int {

        var left = 1
        var right = nums.count - 1

        while left < right {
            let mid = (right - left) / 2 + left

            var counter = 0
            for num in nums {
                if num <= mid {
                    counter += 1
                }
            }

            if counter <= mid {
                left = mid + 1   
            } else {
                right = mid
            }
        }

        return left
    }
}


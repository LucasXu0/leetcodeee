/*
 * @lc app=leetcode.cn id=41 lang=swift
 *
 * [41] 缺失的第一个正数
 *
 * https://leetcode-cn.com/problems/first-missing-positive/description/
 *
 * algorithms
 * Hard (36.12%)
 * Likes:    240
 * Dislikes: 0
 * Total Accepted:    20.1K
 * Total Submissions: 55.7K
 * Testcase Example:  '[1,2,0]'
 *
 * 给定一个未排序的整数数组，找出其中没有出现的最小的正整数。
 * 
 * 示例 1:
 * 
 * 输入: [1,2,0]
 * 输出: 3
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,4,-1,1]
 * 输出: 2
 * 
 * 
 * 示例 3:
 * 
 * 输入: [7,8,9,11,12]
 * 输出: 1
 * 
 * 
 * 说明:
 * 
 * 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的空间。
 * 
 */
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        // return bruteForce(nums)
        return _firstMissingPositive(nums)
    }

    private func _firstMissingPositive(_ nums: [Int]) -> Int {
        
        var nums = nums
        var contains = false
        
        for i in 0..<nums.count {
            if nums[i] == 1 {
                contains = true
            }
            
            if nums[i] <= 0 || nums[i] > nums.count {
                nums[i] = 1
            }
        }

        if !contains {
            return 1
        }

        for i in 0..<nums.count {
            let num = abs(nums[i])
            nums[num-1] = -abs(nums[num-1])
        }

        for i in 0..<nums.count {
            if nums[i] > 0 {
                return i + 1
            }
        }

        return nums.count + 1
    }

    // O(n), but allocate not constant space.
    private func bruteForce(_ nums: [Int]) -> Int {
        var set = Set<Int>()

        nums.forEach { set.insert($0) }

        for i in 0..<nums.count {
            if !set.contains(i+1) {
                return i+1
            }
        }

        return nums.count + 1
    }
}


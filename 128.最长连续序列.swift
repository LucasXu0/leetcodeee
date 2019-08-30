/*
 * @lc app=leetcode.cn id=128 lang=swift
 *
 * [128] 最长连续序列
 *
 * https://leetcode-cn.com/problems/longest-consecutive-sequence/description/
 *
 * algorithms
 * Hard (46.43%)
 * Likes:    155
 * Dislikes: 0
 * Total Accepted:    13.6K
 * Total Submissions: 29.1K
 * Testcase Example:  '[100,4,200,1,3,2]'
 *
 * 给定一个未排序的整数数组，找出最长连续序列的长度。
 * 
 * 要求算法的时间复杂度为 O(n)。
 * 
 * 示例:
 * 
 * 输入: [100, 4, 200, 1, 3, 2]
 * 输出: 4
 * 解释: 最长连续序列是 [1, 2, 3, 4]。它的长度为 4。
 * 
 */
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // return bruteForce(nums)

        return _longestConsecutive(nums)
    }

    private func _longestConsecutive(_ nums: [Int]) -> Int {

        let map = constructMap(nums)

        var len = 0
        var maxLen = 0

        for i in 0..<nums.count {
            if !map.contains(nums[i]-1) {
                
                var start = nums[i]
                while map.contains(start) {
                    len += 1
                    start += 1
                } 

                maxLen = max(maxLen, len)
                len = 0
            }
        }

        return maxLen
    }

    private func constructMap(_ nums: [Int]) -> Set<Int> {
        var res = Set<Int>()

        for num in nums {
            res.insert(num)
        }

        return res
    }

    private func bruteForce(_ nums: [Int]) -> Int {
        let nums = nums.sorted()

        var len = 1
        var maxLen = 1

        guard nums.count > 1 else { return nums.count }

        for i in 0..<nums.count-1 {
            if nums[i] + 1 == nums[i+1] {
                len += 1
                maxLen = max(maxLen, len)
            } else if nums[i] == nums[i+1] {
                // do nothing
            } else {
                len = 1
            }

        }

        return maxLen
    }
}


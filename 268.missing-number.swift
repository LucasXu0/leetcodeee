/*
 * @lc app=leetcode id=268 lang=swift
 *
 * [268] Missing Number
 *
 * https://leetcode.com/problems/missing-number/description/
 *
 * algorithms
 * Easy (49.18%)
 * Likes:    1083
 * Dislikes: 1478
 * Total Accepted:    314.6K
 * Total Submissions: 639.6K
 * Testcase Example:  '[3,0,1]'
 *
 * Given an array containing n distinct numbers taken from 0, 1, 2, ..., n,
 * find the one that is missing from the array.
 * 
 * Example 1:
 * 
 * 
 * Input: [3,0,1]
 * Output: 2
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: [9,6,4,2,3,5,7,0,1]
 * Output: 8
 * 
 * 
 * Note:
 * Your algorithm should run in linear runtime complexity. Could you implement
 * it using only constant extra space complexity?
 */
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var missing = nums.count

        for i in 0..<nums.count {
            missing ^= i ^ nums[i]
        }

        return missing
    }
}


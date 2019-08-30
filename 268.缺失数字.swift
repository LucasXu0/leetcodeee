/*
 * @lc app=leetcode.cn id=268 lang=swift
 *
 * [268] 缺失数字
 *
 * https://leetcode-cn.com/problems/missing-number/description/
 *
 * algorithms
 * Easy (52.17%)
 * Likes:    159
 * Dislikes: 0
 * Total Accepted:    30K
 * Total Submissions: 57.3K
 * Testcase Example:  '[3,0,1]'
 *
 * 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
 * 
 * 示例 1:
 * 
 * 输入: [3,0,1]
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 输入: [9,6,4,2,3,5,7,0,1]
 * 输出: 8
 * 
 * 
 * 说明:
 * 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 * 
 */
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 1. 蛮力法
        // 构建 map，遍历 0..<n 是否存在

        var max = 0

        for num in nums {
            max += num
        }   

        let resMax = nums.count * (nums.count - 1) / 2

        return nums.count - (max - resMax)
    }
}


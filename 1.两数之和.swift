/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 *
 * https://leetcode-cn.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (46.52%)
 * Likes:    6060
 * Dislikes: 0
 * Total Accepted:    515.7K
 * Total Submissions: 1.1M
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 * 
 * 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 * 
 * 示例:
 * 
 * 给定 nums = [2, 7, 11, 15], target = 9
 * 
 * 因为 nums[0] + nums[1] = 2 + 7 = 9
 * 所以返回 [0, 1]
 * 
 * 
 */
class Solution {
    // 思路
    // 1. 用 HashMap 记录每个 num 出现的 index
    // 2. 遍历 Array 的同时查找 HashMap 是否存在 target - 当前 num 的值
    // 3. 如果存在则抛出
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]

        // Use Local Variable
        // 98.91%
        // 5.12%
        // for i in 0..<nums.count {
        //     let num = nums[i]
        //     if map.keys.contains(target - num) {
        //         return [map[target - num]!, i]
        //     } else {
        //         map[num] = i
        //     }
        // }

        // Use if let instead of map.keys.contains
        for i in 0..<nums.count {
            let num = nums[i]
            if let ans = map[target - num] {
                return [ans, i]
            } else {
                map[num] = i
            }
        }

        return []
    }
}


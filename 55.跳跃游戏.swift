/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 *
 * https://leetcode-cn.com/problems/jump-game/description/
 *
 * algorithms
 * Medium (35.99%)
 * Likes:    278
 * Dislikes: 0
 * Total Accepted:    28.4K
 * Total Submissions: 78.8K
 * Testcase Example:  '[2,3,1,1,4]'
 *
 * 给定一个非负整数数组，你最初位于数组的第一个位置。
 * 
 * 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 * 
 * 判断你是否能够到达最后一个位置。
 * 
 * 示例 1:
 * 
 * 输入: [2,3,1,1,4]
 * 输出: true
 * 解释: 从位置 0 到 1 跳 1 步, 然后跳 3 步到达最后一个位置。
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,2,1,0,4]
 * 输出: false
 * 解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
 * 
 * 
 */
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true}

        var max = Int.min
    
        for i in 0..<nums.count - 1 {
            if nums[i] >= max {
                max = nums[i]
            } else {
                max -= 1
            }

            if max == 0 && nums[i] == 0 {
                return false
            }
        }

        return true
    }
}


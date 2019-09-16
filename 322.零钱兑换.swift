/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 *
 * https://leetcode-cn.com/problems/coin-change/description/
 *
 * algorithms
 * Medium (35.25%)
 * Likes:    232
 * Dislikes: 0
 * Total Accepted:    22.4K
 * Total Submissions: 63.1K
 * Testcase Example:  '[1,2,5]\n11'
 *
 * 给定不同面额的硬币 coins 和一个总金额
 * amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 * 
 * 示例 1:
 * 
 * 输入: coins = [1, 2, 5], amount = 11
 * 输出: 3 
 * 解释: 11 = 5 + 5 + 1
 * 
 * 示例 2:
 * 
 * 输入: coins = [2], amount = 3
 * 输出: -1
 * 
 * 说明:
 * 你可以认为每种硬币的数量是无限的。
 * 
 */
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        if amount == 0 { return 0 }

        var dp = Array(repeating: amount + 1, count: amount + 1)

        dp[0] = 0

        for i in 1...amount {
            var minCount = amount + 1
            for j in 0..<coins.count {
                if i >= coins[j] {
                    minCount = min(minCount, dp[i-coins[j]] + 1)
                }
            }
            dp[i] = minCount
        }

        return dp[amount] > amount ? -1 : dp[amount]
    }
}


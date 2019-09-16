/*
 * @lc app=leetcode.cn id=279 lang=swift
 *
 * [279] 完全平方数
 *
 * https://leetcode-cn.com/problems/perfect-squares/description/
 *
 * algorithms
 * Medium (50.83%)
 * Likes:    188
 * Dislikes: 0
 * Total Accepted:    20K
 * Total Submissions: 39.3K
 * Testcase Example:  '12'
 *
 * 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 *
 * 示例 1:
 *
 * 输入: n = 12
 * 输出: 3
 * 解释: 12 = 4 + 4 + 4.
 *
 * 示例 2:
 *
 * 输入: n = 13
 * 输出: 2
 * 解释: 13 = 4 + 9.
 *
 */

import Foundation

class Solution {
    var memo: [Int: Int] = [:]

    func numSquares(_ n: Int) -> Int {
        return dp(n)
    }

    private func dp(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n+1)

        for i in 1...n {
            dp[i] = i

            for j in 1...Int(sqrt(Double(i))) {
                dp[i] = min(dp[i], dp[i-j*j] + 1)
            }
        }

        return dp[n]
    }

    private func dp_memo(_ n: Int) -> Int {

        if n == 0 {
            memo[n] = 0
            return 0
        }

        if let m = memo[n] {
            return m
        }

        let s = Int(sqrt(Double(n)))
        if s * s == n {
            memo[n] = 1
            return 1
        }

        var minNum = Int.max
        for i in 1...s {
            minNum = min(dp(n-i*i) + 1, minNum)
        }
        memo[n] = minNum

        return minNum
    }
}
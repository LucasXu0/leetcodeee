/*
 * @lc app=leetcode.cn id=91 lang=swift
 *
 * [91] 解码方法
 *
 * https://leetcode-cn.com/problems/decode-ways/description/
 *
 * algorithms
 * Medium (21.71%)
 * Likes:    186
 * Dislikes: 0
 * Total Accepted:    15.3K
 * Total Submissions: 70.5K
 * Testcase Example:  '"12"'
 *
 * 一条包含字母 A-Z 的消息通过以下方式进行了编码：
 * 
 * 'A' -> 1
 * 'B' -> 2
 * ...
 * 'Z' -> 26
 * 
 * 
 * 给定一个只包含数字的非空字符串，请计算解码方法的总数。
 * 
 * 示例 1:
 * 
 * 输入: "12"
 * 输出: 2
 * 解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
 * 
 * 
 * 示例 2:
 * 
 * 输入: "226"
 * 输出: 3
 * 解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 * 
 * 
 */
class Solution {
    func numDecodings(_ s: String) -> Int {

        guard s.first != "0" else { return 0 }
    
        var pre = 1
        var cur = 1

        let characters = Array(s)

        for i in 1..<characters.count {
            let tmp = cur
            if characters[i] == "0" {
                if characters[i-1] == "1" || characters[i-1] == "2" {
                    cur = pre
                } else {
                    return 0
                }
            } else if characters[i-1] == "1" || (characters[i-1] == "2" && characters[i] >= "1" && characters[i] <= "6") {
                cur += pre   
            }

            pre = tmp
        }

        return cur
    }
}


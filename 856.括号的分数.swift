/*
 * @lc app=leetcode.cn id=856 lang=swift
 *
 * [856] 括号的分数
 *
 * https://leetcode-cn.com/problems/score-of-parentheses/description/
 *
 * algorithms
 * Medium (54.32%)
 * Likes:    63
 * Dislikes: 0
 * Total Accepted:    2.8K
 * Total Submissions: 5.1K
 * Testcase Example:  '"()"'
 *
 * 给定一个平衡括号字符串 S，按下述规则计算该字符串的分数：
 *
 *
 * () 得 1 分。
 * AB 得 A + B 分，其中 A 和 B 是平衡括号字符串。
 * (A) 得 2 * A 分，其中 A 是平衡括号字符串。
 *
 *
 *
 *
 * 示例 1：
 *
 * 输入： "()"
 * 输出： 1
 *
 *
 * 示例 2：
 *
 * 输入： "(())"
 * 输出： 2
 *
 *
 * 示例 3：
 *
 * 输入： "()()"
 * 输出： 2
 *
 *
 * 示例 4：
 *
 * 输入： "(()(()))"
 * 输出： 6
 *
 *
 *
 *
 * 提示：
 *
 *
 * S 是平衡括号字符串，且只含有 ( 和 ) 。
 * 2 <= S.length <= 50
 *
 *
 */

// @lc code=start
class Solution {
    func scoreOfParentheses(_ s: String) -> Int {

        let sc = Array(s)

        var stack: [String] = []

        for ele in sc {
            if !stack.isEmpty, ele == ")" {
                let last = stack.last!
                if last == "(" {
                    stack.removeLast()
                    stack.append("1")
                } else {
                    var cnt = 0
                    while !stack.isEmpty && stack.last! != "(" {
                        cnt += s_to_i(stack.removeLast())
                    }
                    if !stack.isEmpty {
                        stack.removeLast()
                        stack.append(i_to_s(2*cnt))
                    }
                }
            } else {
                stack.append(String(ele))
            }
        }

        var cnt = 0
        while !stack.isEmpty {
            cnt += s_to_i(stack.removeLast())
        }

        return cnt
    }

    private func s_to_i(_ c: String) -> Int {
        return Int(c)!
    }

    private func i_to_s(_ i: Int) -> String {
        return String(i)
    }
}
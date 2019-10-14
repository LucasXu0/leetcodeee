/*
 * @lc app=leetcode.cn id=306 lang=swift
 *
 * [306] 累加数
 *
 * https://leetcode-cn.com/problems/additive-number/description/
 *
 * algorithms
 * Medium (31.47%)
 * Likes:    37
 * Dislikes: 0
 * Total Accepted:    2.4K
 * Total Submissions: 7.7K
 * Testcase Example:  '"112358"'
 *
 * 累加数是一个字符串，组成它的数字可以形成累加序列。
 *
 * 一个有效的累加序列必须至少包含 3 个数。除了最开始的两个数以外，字符串中的其他数都等于它之前两个数相加的和。
 *
 * 给定一个只包含数字 '0'-'9' 的字符串，编写一个算法来判断给定输入是否是累加数。
 *
 * 说明: 累加序列里的数不会以 0 开头，所以不会出现 1, 2, 03 或者 1, 02, 3 的情况。
 *
 * 示例 1:
 *
 * 输入: "112358"
 * 输出: true
 * 解释: 累加序列为: 1, 1, 2, 3, 5, 8 。1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
 *
 *
 * 示例 2:
 *
 * 输入: "199100199"
 * 输出: true
 * 解释: 累加序列为: 1, 99, 100, 199。1 + 99 = 100, 99 + 100 = 199
 *
 * 进阶:
 * 你如何处理一个溢出的过大的整数输入?
 *
 */

// @lc code=start
class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {

        var ns = Array(num)

        if ns.count < 3 { return false }

        func dfs(_ first: Int, _ second: Int, _ index: Int) -> Bool {

            if index >= ns.count { return false }

            let thrid = first + second

            let ts = int_to_characters(thrid)

            if is_contains(index, ts, ns) {
                if ts.count + index == ns.count {
                    return true
                }

                return dfs(second, characters_to_int(ts), index + ts.count)
            }

            return false
        }

        for i in 1..<ns.count/2+1 {
            let first = Array(ns[0..<i])

            if ns[0] == "0" && first.count != 1 {
                return false
            }

            for j in i..<ns.count {
                let second = Array(ns[i..<j+1])

                if ns[i] == "0" && second.count != 1 {
                    continue
                }

                if dfs(characters_to_int(first), characters_to_int(second), j+1) {
                    return true
                }
            }
        }

        return false
    }

    private func is_contains(_ index: Int, _ ele: [Character], _ target: [Character]) -> Bool {

        guard ele.count + index <= target.count else { return false }

        for i in 0..<ele.count {
            if ele[i] != target[i+index] {
                return false
            }
        }

        return true
    }

    private func int_to_characters(_ num: Int) -> [Character] {
        return Array("\(num)")
    }

    private func characters_to_int(_ cs: [Character]) -> Int {
        return Int(String(cs))!
    }
}
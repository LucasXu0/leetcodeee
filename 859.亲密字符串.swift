/*
 * @lc app=leetcode.cn id=859 lang=swift
 *
 * [859] 亲密字符串
 *
 * https://leetcode-cn.com/problems/buddy-strings/description/
 *
 * algorithms
 * Easy (27.04%)
 * Likes:    58
 * Dislikes: 0
 * Total Accepted:    6.5K
 * Total Submissions: 23.8K
 * Testcase Example:  '"ab"\n"ba"'
 *
 * 给定两个由小写字母构成的字符串 A 和 B ，只要我们可以通过交换 A 中的两个字母得到与 B 相等的结果，就返回 true ；否则返回 false
 * 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入： A = "ab", B = "ba"
 * 输出： true
 * 
 * 
 * 示例 2：
 * 
 * 输入： A = "ab", B = "ab"
 * 输出： false
 * 
 * 
 * 示例 3:
 * 
 * 输入： A = "aa", B = "aa"
 * 输出： true
 * 
 * 
 * 示例 4：
 * 
 * 输入： A = "aaaaaaabc", B = "aaaaaaacb"
 * 输出： true
 * 
 * 
 * 示例 5：
 * 
 * 输入： A = "", B = "aa"
 * 输出： false
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= A.length <= 20000
 * 0 <= B.length <= 20000
 * A 和 B 仅由小写字母构成。
 * 
 * 
 */

// @lc code=start
class Solution {
    func buddyStrings(_ a: String, _ b: String) -> Bool {

        let ac = Array(a)
        let bc = Array(b)

        if ac.count != bc.count { return false }

        let n = ac.count 

        if ac == bc {

            var map: [Character: Int] = [:]

            for i in 0..<n {
                map[ac[i], default: 0] += 1
            }

            for ele in map {
                if ele.value > 1 { 
                    return true
                }
            }

            return false

        } else {

            var diffa: [Character] = []
            var diffb: [Character] = []

            for i in 0..<n {
                if ac[i] == bc[i] { continue }

                diffa.append(ac[i])
                diffb.append(bc[i])
            }

            if diffa.count != 2 { return false }   

            return diffa == diffb.reversed()
        }
    }
}
// @lc code=end


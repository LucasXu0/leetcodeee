/*
 * @lc app=leetcode id=14 lang=swift
 *
 * [14] Longest Common Prefix
 *
 * https://leetcode.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (34.10%)
 * Likes:    1591
 * Dislikes: 1453
 * Total Accepted:    536.5K
 * Total Submissions: 1.6M
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * Write a function to find the longest common prefix string amongst an array
 * of strings.
 * 
 * If there is no common prefix, return an empty string "".
 * 
 * Example 1:
 * 
 * 
 * Input: ["flower","flow","flight"]
 * Output: "fl"
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: ["dog","racecar","car"]
 * Output: ""
 * Explanation: There is no common prefix among the input strings.
 * 
 * 
 * Note:
 * 
 * All given inputs are in lowercase letters a-z.
 * 
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {

        guard !strs.isEmpty else { return "" }

        var minLength = Int.max
        var commonPrefix = ""

        for i in 0..<strs.count {
            if strs[i].count < minLength {
                minLength = strs[i].count
                commonPrefix = strs[i]
            }
        }

        var done = false
        while !commonPrefix.isEmpty && !done {
            done = true
            for str in strs {
                if !str.hasPrefix(commonPrefix) {
                    commonPrefix.removeLast()
                    done = false
                    break
                }
            }
        }

        return commonPrefix
    }

    private func verySlow(_ strs: [String]) -> String {

        let minLength = strs.reduce(Int.max, { res, str in
            min(res, str.count)
        })

        var res = ""
        for i in 0..<minLength {
            var isSame = true
            for j in 0..<strs.count - 1 {
                if Array(strs[j])[i] != Array(strs[j+1])[i] {
                    isSame = false
                }
            }
            if isSame {
                res.append(Array(strs[0])[i])
            } else {
                break
            }
        }

        return res
    }
}


/*
 * @lc app=leetcode.cn id=1092 lang=swift
 *
 * [1092] 最短公共超序列
 *
 * https://leetcode-cn.com/problems/shortest-common-supersequence/description/
 *
 * algorithms
 * Hard (36.06%)
 * Likes:    8
 * Dislikes: 0
 * Total Accepted:    463
 * Total Submissions: 1.3K
 * Testcase Example:  '"abac"\n"cab"'
 *
 * 给出两个字符串 str1 和 str2，返回同时以 str1 和 str2
 * 作为子序列的最短字符串。如果答案不止一个，则可以返回满足条件的任意一个答案。
 * 
 * （如果从字符串 T 中删除一些字符（也可能不删除，并且选出的这些字符可以位于 T 中的 任意位置），可以得到字符串 S，那么 S 就是 T
 * 的子序列）
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：str1 = "abac", str2 = "cab"
 * 输出："cabac"
 * 解释：
 * str1 = "abac" 是 "cabac" 的一个子串，因为我们可以删去 "cabac" 的第一个 "c"得到 "abac"。 
 * str2 = "cab" 是 "cabac" 的一个子串，因为我们可以删去 "cabac" 末尾的 "ac" 得到 "cab"。
 * 最终我们给出的答案是满足上述属性的最短字符串。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= str1.length, str2.length <= 1000
 * str1 和 str2 都由小写英文字母组成。
 * 
 * 
 */

// @lc code=start
class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        var s1 = Array(str1)
        var s2 = Array(str2)

        let lcs = _lcs(s1, s2)

        var res: [Character] = []

        var i = 0
        var j = 0
        for c in lcs {
            while s1[i] != c {
                res.append(s1[i])
                i += 1
            }
            while s2[j] != c {
                res.append(s2[j])
                j += 1
            }
            res.append(c)
            i += 1
            j += 1
        }

        while i < s1.count {
            res.append(s1[i])
            i += 1
        }

        while j < s2.count {
            res.append(s2[j])
            j += 1
        }

        return String(res)
    }

    private func _lcs(_ s1: [Character], _ s2: [Character]) -> [Character] {
        
        let n = s1.count
        let m = s2.count

        var dp: [[[Character]]] = Array(repeating: Array(repeating: [], count: m+1), count: n+1)

        for i in 0..<n {
            for j in 0..<m {
                if s1[i] == s2[j] {
                    dp[i+1][j+1] = dp[i][j]
                    dp[i+1][j+1].append(s1[i])
                } else {
                    if dp[i+1][j].count > dp[i][j+1].count {
                        dp[i+1][j+1] = dp[i+1][j]
                    } else {
                        dp[i+1][j+1] = dp[i][j+1]
                    }
                }
            }
        }

        return dp[n][m]
    }
}
// @lc code=end


/*
 * @lc app=leetcode.cn id=854 lang=swift
 *
 * [854] 相似度为 K 的字符串
 *
 * https://leetcode-cn.com/problems/k-similar-strings/description/
 *
 * algorithms
 * Hard (24.53%)
 * Likes:    24
 * Dislikes: 0
 * Total Accepted:    695
 * Total Submissions: 2.8K
 * Testcase Example:  '"ab"\n"ba"'
 *
 * 如果可以通过将 A 中的两个小写字母精确地交换位置 K 次得到与 B 相等的字符串，我们称字符串 A 和 B 的相似度为 K（K 为非负整数）。
 *
 * 给定两个字母异位词 A 和 B ，返回 A 和 B 的相似度 K 的最小值。
 *
 *
 *
 * 示例 1：
 *
 * 输入：A = "ab", B = "ba"
 * 输出：1
 *
 *
 * 示例 2：
 *
 * 输入：A = "abc", B = "bca"
 * 输出：2
 *
 *
 * 示例 3：
 *
 * 输入：A = "abac", B = "baca"
 * 输出：2
 *
 *
 * 示例 4：
 *
 * 输入：A = "aabc", B = "abca"
 * 输出：2
 *
 *
 *
 * 提示：
 *
 *
 * 1 <= A.length == B.length <= 20
 * A 和 B 只包含集合 {'a', 'b', 'c', 'd', 'e', 'f'} 中的小写字母。
 *
 *
 */

// @lc code=start
class Solution {
    func kSimilarity(_ a: String, _ b: String) -> Int {
        return _kSimilarity(Array(a), Array(b))
    }

    func _kSimilarity(_ ac: [Character], _ bc:  [Character]) -> Int {

        if ac == bc { return 0 }

        var bc = bc

        let n = ac.count

        var cnt = n - 1

        for i in 0..<n {
            if ac[i] == bc[i] { continue }

            var j = i + 1

            var matches: [Int] = []

            while j < n {

                if ac[i] == bc[j] && ac[j] != bc[j] {

                    matches.append(j)

                    if ac[j] == bc[i] {
                        bc.swapAt(i, j)
                        let start = i + 1
                        return 1 + _kSimilarity(Array(ac[start...]), Array(bc[start...]))
                    }
                }

                j += 1
            }

            for j in matches {
                bc.swapAt(i, j)
                let start = i + 1
                cnt = min(cnt, 1 + _kSimilarity(Array(ac[start...]), Array(bc[start...])))
                bc.swapAt(i, j)
            }

            return cnt
        }

        return 0
    }
}
// @lc code=end


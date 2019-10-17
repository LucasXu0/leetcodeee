/*
 * @lc app=leetcode.cn id=869 lang=swift
 *
 * [869] 重新排序得到 2 的幂
 *
 * https://leetcode-cn.com/problems/reordered-power-of-2/description/
 *
 * algorithms
 * Medium (45.62%)
 * Likes:    15
 * Dislikes: 0
 * Total Accepted:    1.8K
 * Total Submissions: 4K
 * Testcase Example:  '1'
 *
 * 给定正整数 N ，我们按任何顺序（包括原始顺序）将数字重新排序，注意其前导数字不能为零。
 * 
 * 如果我们可以通过上述方式得到 2 的幂，返回 true；否则，返回 false。
 * 
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：1
 * 输出：true
 * 
 * 
 * 示例 2：
 * 
 * 输入：10
 * 输出：false
 * 
 * 
 * 示例 3：
 * 
 * 输入：16
 * 输出：true
 * 
 * 
 * 示例 4：
 * 
 * 输入：24
 * 输出：false
 * 
 * 
 * 示例 5：
 * 
 * 输入：46
 * 输出：true
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= N <= 10^9
 * 
 * 
 */

// @lc code=start
class Solution {
    func reorderedPowerOf2(_ n: Int) -> Bool {
        
        var ns: [Int] = []

        var i = 1

        while i < Int(1e9) {
            ns.append(i)
            i *= 2
        }

        var target: [Int: Int] = [:]

        for x in String(n) {
            let xn = Int(String(x))!
            target[xn, default: 0] += 1
        }

        for x in ns {
            var map: [Int: Int] = [:]

            for ele in String(x) {
                let en = Int(String(ele))!
                map[en, default: 0] += 1
            }

            if map == target { return true }
        }

        return false
    }
}
// @lc code=end


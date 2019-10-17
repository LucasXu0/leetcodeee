/*
 * @lc app=leetcode.cn id=870 lang=swift
 *
 * [870] 优势洗牌
 *
 * https://leetcode-cn.com/problems/advantage-shuffle/description/
 *
 * algorithms
 * Medium (32.50%)
 * Likes:    34
 * Dislikes: 0
 * Total Accepted:    2.8K
 * Total Submissions: 8.7K
 * Testcase Example:  '[2,7,11,15]\n[1,10,4,11]'
 *
 * 给定两个大小相等的数组 A 和 B，A 相对于 B 的优势可以用满足 A[i] > B[i] 的索引 i 的数目来描述。
 * 
 * 返回 A 的任意排列，使其相对于 B 的优势最大化。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：A = [2,7,11,15], B = [1,10,4,11]
 * 输出：[2,11,7,15]
 * 
 * 
 * 示例 2：
 * 
 * 输入：A = [12,24,8,32], B = [13,25,32,11]
 * 输出：[24,32,8,12]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= A.length = B.length <= 10000
 * 0 <= A[i] <= 10^9
 * 0 <= B[i] <= 10^9
 * 
 * 
 */

// @lc code=start
class Solution {
    func advantageCount(_ a: [Int], _ b: [Int]) -> [Int] {
        
        var sa = a.sorted()
        
        let n = a.count 

        var sb = b.enumerated().sorted(by: { $0.1 < $1.1 })

        var i = 0
        var j = n - 1

        var res = Array(repeating: 0, count: n)

        var k = 0

        while i <= j {

            if sa[k] > sb[i].element {
                res[sb[i].offset] = sa[k]
                i += 1
            } else {
                res[sb[j].offset] = sa[k]
                j -= 1
            }   

            k += 1
        }

        return res
    }
}
// @lc code=end


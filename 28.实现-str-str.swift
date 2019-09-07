/*
 * @lc app=leetcode.cn id=28 lang=swift
 *
 * [28] 实现 strStr()
 *
 * https://leetcode-cn.com/problems/implement-strstr/description/
 *
 * algorithms
 * Easy (38.79%)
 * Likes:    256
 * Dislikes: 0
 * Total Accepted:    79.4K
 * Total Submissions: 204.6K
 * Testcase Example:  '"hello"\n"ll"'
 *
 * 实现 strStr() 函数。
 * 
 * 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置
 * (从0开始)。如果不存在，则返回  -1。
 * 
 * 示例 1:
 * 
 * 输入: haystack = "hello", needle = "ll"
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 输入: haystack = "aaaaa", needle = "bba"
 * 输出: -1
 * 
 * 
 * 说明:
 * 
 * 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 * 
 * 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 * 
 */
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        guard !needle.isEmpty else { return 0 }

        guard haystack.count >= needle.count else { return -1 }

        var i = 0

        let haystackcs = Array(haystack)
        let needlecs = Array(needle)

        while i <= haystackcs.count - needlecs.count { // 只需要检查这些部分就可以

            var j = 0
            while j < needlecs.count && haystackcs[i+j] == needlecs[j] {
                j += 1
            }
            
            if j == needlecs.count {
                return i
            }

            i += 1
        }

        return -1
    }
}


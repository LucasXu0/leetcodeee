/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 *
 * https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (31.12%)
 * Likes:    2326
 * Dislikes: 0
 * Total Accepted:    198.8K
 * Total Submissions: 638.8K
 * Testcase Example:  '"abcabcbb"'
 *
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 * 
 * 示例 1:
 * 
 * 输入: "abcabcbb"
 * 输出: 3 
 * 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 * 
 * 
 * 示例 2:
 * 
 * 输入: "bbbbb"
 * 输出: 1
 * 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 * 
 * 
 * 示例 3:
 * 
 * 输入: "pwwkew"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 * 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 * 
 * 
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        return _lengthOfLongestSubstring2(s)
    }

    private func _lengthOfLongestSubstring2(_ s: String) -> Int {

        var start = 0
        var maxLength = 0

        var charactersMap: [Character: Int] = [:]

        let characters = Array(s)

        for i in 0..<characters.count {

            // 同下
            if let find = charactersMap[characters[i]] {
                start = max(start, find + 1) //  find 的位置起码要比 start 大
            }

            charactersMap[characters[i]] = i
            
            maxLength = max(maxLength, i - start + 1)
        }

        return maxLength
    }

    private func _lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLength = 0
        var start = 0
        var hashMap: [Character: Int] = [:]

        let characters = Array(s)

        for i in 0..<characters.count {

            // 从哈希表中找是否存在当前元素, 并且找到的 元素的位置 >= 起点
            // 更新起点位置
            if let find = hashMap[characters[i]], find >= start {
                start = find + 1
            } else {
                maxLength = max(maxLength, i - start + 1)
            }

            hashMap[characters[i]] = i
        }

        return maxLength
    }
}


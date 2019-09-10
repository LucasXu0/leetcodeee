/*
 * @lc app=leetcode id=3 lang=swift
 *
 * [3] Longest Substring Without Repeating Characters
 *
 * https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (28.82%)
 * Likes:    6292
 * Dislikes: 358
 * Total Accepted:    1.1M
 * Total Submissions: 3.8M
 * Testcase Example:  '"abcabcbb"'
 *
 * Given a string, find the length of the longest substring without repeating
 * characters.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: "abcabcbb"
 * Output: 3 
 * Explanation: The answer is "abc", with the length of 3. 
 * 
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "bbbbb"
 * Output: 1
 * Explanation: The answer is "b", with the length of 1.
 * 
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: "pwwkew"
 * Output: 3
 * Explanation: The answer is "wke", with the length of 3. 
 * ⁠            Note that the answer must be a substring, "pwke" is a
 * subsequence and not a substring.
 * 
 * 
 * 
 * 
 * 
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var hashTable: [Character: Int] = [:]
        var start = 0
        var maxLength = 0

        s.enumerated().forEach { (i, c) in
            // update index if hashTable exist the same value 
            // and the value is greater than start index
            if let index = hashTable[c], index >= start {
                start = index + 1
            }

            hashTable[c] = i
            maxLength = max(maxLength, i - start + 1)
        }

        return maxLength
    }
}


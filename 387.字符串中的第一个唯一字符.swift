/*
 * @lc app=leetcode.cn id=387 lang=swift
 *
 * [387] 字符串中的第一个唯一字符
 *
 * https://leetcode-cn.com/problems/first-unique-character-in-a-string/description/
 *
 * algorithms
 * Easy (40.22%)
 * Likes:    140
 * Dislikes: 0
 * Total Accepted:    40.4K
 * Total Submissions: 100.3K
 * Testcase Example:  '"leetcode"'
 *
 * 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 * 
 * 案例:
 * 
 * 
 * s = "leetcode"
 * 返回 0.
 * 
 * s = "loveleetcode",
 * 返回 2.
 * 
 * 
 * 
 * 
 * 注意事项：您可以假定该字符串只包含小写字母。
 * 
 */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        var sMap: [Character: [Int]] = [:]
        let sArray = Array(s)
        for i in 0..<sArray.count {
            sMap[sArray[i], default: []].append(i)
        }

        var minIndex = Int.max
        for ele in sMap {
            if ele.value.count == 1 { // 只出现一次
                let firstIndex = ele.value[0]
                minIndex = min(minIndex, firstIndex)
            }
        }

        if minIndex == Int.max {
            return -1
        }

        return minIndex
    }
}


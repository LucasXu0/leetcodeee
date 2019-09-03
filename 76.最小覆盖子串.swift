/*
 * @lc app=leetcode.cn id=76 lang=swift
 *
 * [76] 最小覆盖子串
 *
 * https://leetcode-cn.com/problems/minimum-window-substring/description/
 *
 * algorithms
 * Hard (36.15%)
 * Likes:    208
 * Dislikes: 0
 * Total Accepted:    10.6K
 * Total Submissions: 29.4K
 * Testcase Example:  '"ADOBECODEBANC"\n"ABC"'
 *
 * 给你一个字符串 S、一个字符串 T，请在字符串 S 里面找出：包含 T 所有字母的最小子串。
 * 
 * 示例：
 * 
 * 输入: S = "ADOBECODEBANC", T = "ABC"
 * 输出: "BANC"
 * 
 * 说明：
 * 
 * 
 * 如果 S 中不存这样的子串，则返回空字符串 ""。
 * 如果 S 中存在这样的子串，我们保证它是唯一的答案。
 * 
 * 
 */
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        
        var tMap: [Character: Int] = [:]

        let tArray: [Character] = Array(t)

        // 构造哈希表记录 t 中每个字符出现的次数
        for i in 0..<tArray.count {
            tMap[tArray[i], default: 0] += 1
        }

        var left = 0
        var right = 0
        var minW = Int.max
        var start = 0
        var totalCount = tArray.count

        let sArray: [Character] = Array(s)
        while right < sArray.count {

            if tMap[sArray[right]] != nil {
                if tMap[sArray[right]]! > 0 {
                    totalCount -= 1
                }
                tMap[sArray[right]]! -= 1
            }

            while totalCount == 0 {
                if tMap[sArray[left]] != nil {
                    if tMap[sArray[left]]! == 0 { // 要原本为零的位置+1了才代表总数+1
                        totalCount += 1
                        
                        if right - left < minW {
                            minW = right - left
                            start = left
                        }
                    }
                    tMap[sArray[left]]! += 1
                }

                left += 1
            }

            right += 1
        }

        // 找不到
        if minW == Int.max {
            return ""
        }

        return String(Array(sArray[start...start+minW]))
    }
}


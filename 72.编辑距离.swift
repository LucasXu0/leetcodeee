/*
 * @lc app=leetcode.cn id=72 lang=swift
 *
 * [72] 编辑距离
 *
 * https://leetcode-cn.com/problems/edit-distance/description/
 *
 * algorithms
 * Hard (54.39%)
 * Likes:    333
 * Dislikes: 0
 * Total Accepted:    14.4K
 * Total Submissions: 26.3K
 * Testcase Example:  '"horse"\n"ros"'
 *
 * 给定两个单词 word1 和 word2，计算出将 word1 转换成 word2 所使用的最少操作数 。
 * 
 * 你可以对一个单词进行如下三种操作：
 * 
 * 
 * 插入一个字符
 * 删除一个字符
 * 替换一个字符
 * 
 * 
 * 示例 1:
 * 
 * 输入: word1 = "horse", word2 = "ros"
 * 输出: 3
 * 解释: 
 * horse -> rorse (将 'h' 替换为 'r')
 * rorse -> rose (删除 'r')
 * rose -> ros (删除 'e')
 * 
 * 
 * 示例 2:
 * 
 * 输入: word1 = "intention", word2 = "execution"
 * 输出: 5
 * 解释: 
 * intention -> inention (删除 't')
 * inention -> enention (将 'i' 替换为 'e')
 * enention -> exention (将 'n' 替换为 'x')
 * exention -> exection (将 'n' 替换为 'c')
 * exection -> execution (插入 'u')
 * 
 * 
 */
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {

        if word1.isEmpty {
            return word2.count
        }

        if word2.isEmpty {
            return word1.count
        }

        
        let n = word2.count
        let m = word1.count

        var previousRows = Array(repeating: 0, count: n+1)
        var currentRows = previousRows

        for i in 1...n {
            previousRows[i] = i
        }

        var word1 = Array(word1)
        var word2 = Array(word2)

        for i in 0..<m {

            currentRows[0] = i + 1

            for j in 1...n {

                if word1[i] == word2[j-1] {
                    currentRows[j] = previousRows[j-1]
                } else {
                    currentRows[j] = min(previousRows[j], currentRows[j-1])
                    currentRows[j] = min(currentRows[j], previousRows[j-1])
                    currentRows[j] += 1
                }
            }

            previousRows = currentRows
        }

        return currentRows.last!
    }
}


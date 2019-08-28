/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 *
 * https://leetcode-cn.com/problems/plus-one/description/
 *
 * algorithms
 * Easy (40.46%)
 * Likes:    330
 * Dislikes: 0
 * Total Accepted:    72K
 * Total Submissions: 177.5K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 * 
 * 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 * 
 * 你可以假设除了整数 0 之外，这个整数不会以零开头。
 * 
 * 示例 1:
 * 
 * 输入: [1,2,3]
 * 输出: [1,2,4]
 * 解释: 输入数组表示数字 123。
 * 
 * 
 * 示例 2:
 * 
 * 输入: [4,3,2,1]
 * 输出: [4,3,2,2]
 * 解释: 输入数组表示数字 4321。
 * 
 * 
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var digits = digits
        var last = digits.count - 1
        let lastPlusOne = digits[last] + 1

        // 进位
        if lastPlusOne > 9 {

            var i = last
            while i >= 0 {
                // 如果不是第一位而且等于9就可以进位
                if digits[i] == 9 && i != 0 {
                    digits[i] = 0
                } else if digits[i] == 9 && i == 0 {
                    // 如果是第一位进位要 + 1
                    digits[i] = 1
                    digits.append(0)
                } else {
                    digits[i] += 1
                    break
                }
                i -= 1
            }
            
        } else {
            digits[last] = lastPlusOne
        }

        return digits
    }
}


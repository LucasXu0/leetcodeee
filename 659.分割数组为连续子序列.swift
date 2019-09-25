/*
 * @lc app=leetcode.cn id=659 lang=swift
 *
 * [659] 分割数组为连续子序列
 *
 * https://leetcode-cn.com/problems/split-array-into-consecutive-subsequences/description/
 *
 * algorithms
 * Medium (41.65%)
 * Likes:    30
 * Dislikes: 0
 * Total Accepted:    1.2K
 * Total Submissions: 3K
 * Testcase Example:  '[1,2,3,3,4,5]'
 *
 * 输入一个按升序排序的整数数组（可能包含重复数字），你需要将它们分割成几个子序列，其中每个子序列至少包含三个连续整数。返回你是否能做出这样的分割？
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入: [1,2,3,3,4,5]
 * 输出: True
 * 解释:
 * 你可以分割出这样两个连续子序列 : 
 * 1, 2, 3
 * 3, 4, 5
 * 
 * 
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入: [1,2,3,3,4,4,5,5]
 * 输出: True
 * 解释:
 * 你可以分割出这样两个连续子序列 : 
 * 1, 2, 3, 4, 5
 * 3, 4, 5
 * 
 * 
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入: [1,2,3,4,4,5]
 * 输出: False
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 输入的数组长度范围为 [1, 10000]
 * 
 * 
 * 
 * 
 */
class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        
        // 能拼接在前面数组的后面
        // 或者作为新的连续数组的开头

        var freq: [Int: Int] = [:]
        for num in nums {
            freq[num, default: 0] += 1
        }

        var end: [Int: Int] = [:]

        for i in 0..<nums.count {
 
            let num = nums[i]

            if freq[num] == 0 { // 出现次数为零说明已经被人用了
                continue
            }

            freq[num]! -= 1

            if end[num, default: 0] > 0 { // 如果可以拼接在前面的数组里面
                end[num]! -= 1
                end[num+1, default: 0] += 1
            } else if freq[num+1, default: 0] > 0 && freq[num+2, default: 0] > 0 { // 可以组成新的数组
                freq[num+1, default: 0] -= 1
                freq[num+2, default: 0] -= 1
                end[num+3, default: 0] += 1
            } else {
                return false
            }
        }

        return true
    }
}


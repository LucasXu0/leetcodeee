/*
 * @lc app=leetcode.cn id=169 lang=swift
 *
 * [169] 求众数
 *
 * https://leetcode-cn.com/problems/majority-element/description/
 *
 * algorithms
 * Easy (60.28%)
 * Likes:    306
 * Dislikes: 0
 * Total Accepted:    65K
 * Total Submissions: 107.8K
 * Testcase Example:  '[3,2,3]'
 *
 * 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 * 
 * 你可以假设数组是非空的，并且给定的数组总是存在众数。
 * 
 * 示例 1:
 * 
 * 输入: [3,2,3]
 * 输出: 3
 * 
 * 示例 2:
 * 
 * 输入: [2,2,1,1,1,2,2]
 * 输出: 2
 * 
 * 
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        // O(n)
        // return bruteForce(nums)

        // 
        return _majorityElement(nums)
    }

    private func _majorityElement(_ nums: [Int]) -> Int {

        var president = nums[0]
        var counter = 0

        for num in nums {
            if num == president {
                counter += 1
            } else {
                counter -= 1
            }

            if counter == 0 {
                president = num
                counter += 1
            }
        }

        return president
    }

    // 蛮力法可以解决, 记录出现次数, O(n)
    private func bruteForce(_ nums: [Int]) -> Int {
        var counter: [Int: Int] = [:]

        for num in nums {
            if counter[num] != nil {
                counter[num] = counter[num]! + 1
            } else {
                counter[num] = 1
            }

            if counter[num]! > nums.count / 2 {
                return num
            }
        }

        return -1
    }
}


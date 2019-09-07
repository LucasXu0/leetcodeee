/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 *
 * https://leetcode-cn.com/problems/3sum/description/
 *
 * algorithms
 * Medium (23.68%)
 * Likes:    1269
 * Dislikes: 0
 * Total Accepted:    84.6K
 * Total Submissions: 357K
 * Testcase Example:  '[-1,0,1,2,-1,-4]'
 *
 * 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0
 * ？找出所有满足条件且不重复的三元组。
 * 
 * 注意：答案中不可以包含重复的三元组。
 * 
 * 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 * 
 * 满足要求的三元组集合为：
 * [
 * ⁠ [-1, 0, 1],
 * ⁠ [-1, -1, 2]
 * ]
 * 
 * 
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        
        let count = nums.count

        guard count > 2 else { return res }

        // sort this nums
        var nums = nums.sorted()
        
        // optimization 1. no solution if first value and last value have same symbol.
        // optimization 2. no solution if first value is bigger than 0.
        guard nums.first! <= 0 && nums.last! >= 0 else { return res }
        
        var left = 0
        var right = 0
        var sum = 0
        
        for i in 0..<count-2 {
            // if nums[i] is greater than 0 means the sum of the rest array can not be zero
            if nums[i] > 0 { break }
            // find the first value that is not repeat
            if i > 0 && nums[i] == nums[i-1] { continue }

            left = i + 1
            right = count - 1

            while left < right {
                sum = nums[i] + nums[left] + nums[right]

                if sum == 0 {
                    res.append([nums[i], nums[left], nums[right]])
                    repeat {
                        right -= 1
                    } while left < right && nums[right] == nums[right+1] 
                    repeat {
                        left += 1
                    } while left < right && nums[left] == nums[left-1]
                } else if sum > 0 {
                    repeat {
                        right -= 1
                    } while left < right && nums[right] == nums[right+1] 
                } else {
                    repeat {
                        left += 1
                    } while left < right && nums[left] == nums[left-1]
                }
            }
        }

        return res
    }
}
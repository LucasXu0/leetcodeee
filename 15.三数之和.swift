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
        // sort this nums

        var res: [[Int]] = []
        
        let count = nums.count

        guard count > 2 else { return res }

        var nums = nums.sorted()
        
        // optimization 1. no solution if first value and last value have same symbol.
        // optimization 2. no solution if first value is bigger than 0.
        guard nums.first! < 0 && nums.last! > 0 else { return res }
        
        for i in 0..<count-2 {
            // find the first value that is not repeat
            if nums[i] == nums[i+1] { continue }
            if nums[i] > 0 { break }

            var left = i + 1
            var right = count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                
                if sum == 0 {
                    res.append([nums[i], nums[left], nums[right]])
                } else if sum > 0 {
                    right -= 1
                    while nums[right] == nums[right-1] {
                        right -= 1
                    }
                } else {
                    left += 1
                    while nums[left] == nums[left+1] {
                        left += 1
                    }
                }
            }
        }

        return res
    }

    // this solution does not filter the same value case 
    private func _threeSum(_ nums: [Int]) -> [[Int]] {
        // convert this problem to two sums
        var res: [[Int]] = []
        for i in 0..<nums.count {
            let target = 0 - nums[i]
            let foo = twoSum(nums, target, i, nums.count)
            foo.forEach {
                res.append($0.append(i))
            }
        }
        return res
    }

    private func twoSum(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> [[Int]] {

        guard start <= end else { return [] } 
        
        var map: [Int: Int] = [:]
        var res: [[Int]] = []

        for i in start...end {
            if let value = map[target - nums[i]] {
                res.append([value, i])
            }
            map[nums[i]] = i
        }

        return res
    }

    // 包含了重复元素
    private func bruteForce(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []

        let count = nums.count
        for i in 0..<count-2 {
            for j in i+1..<count-1 {
                for k in j+1..<count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        res.append([nums[i], nums[j], nums[k]])
                    }
                }
            }
        }

        return res
    }
}


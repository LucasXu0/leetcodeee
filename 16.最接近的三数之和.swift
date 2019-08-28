/*
 * @lc app=leetcode.cn id=16 lang=swift
 *
 * [16] 最接近的三数之和
 *
 * https://leetcode-cn.com/problems/3sum-closest/description/
 *
 * algorithms
 * Medium (41.50%)
 * Likes:    235
 * Dislikes: 0
 * Total Accepted:    38.3K
 * Total Submissions: 92.3K
 * Testcase Example:  '[-1,2,1,-4]\n1'
 *
 * 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target
 * 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 * 
 * 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 * 
 * 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 * 
 * 
 */
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        // Time Limit Exceeded
        // return bruteForce(nums, target)
    }

    private func 

    // 暴力法遍历所有结果
    private func bruteForce(_ nums: [Int], _ target: Int) -> Int {
        
        let count = nums.count
        var res = 0
        // 数据少于3直接返回
        guard count > 3 else {
            nums.forEach { res += $0 }
            return res
        }

        // 遍历数组获取全部三数之和
        var sums: [Int] = []
        for i in 0..<count-2 {
            for j in i+1..<count-1 {
                for k in j+1..<count {
                    sums.append(nums[i] + nums[j] + nums[k])
                }
            }
        }

        // 从三数之和里面找到最接近的
        var min = Int.max
        for i in 0..<sums.count {
            if abs(sums[i] - target) < min {
                min = abs(sums[i] - target)
                res = sums[i]
            }
        }

        return res
    }
}


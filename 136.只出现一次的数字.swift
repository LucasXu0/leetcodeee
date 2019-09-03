/*
 * @lc app=leetcode.cn id=136 lang=swift
 *
 * [136] 只出现一次的数字
 *
 * https://leetcode-cn.com/problems/single-number/description/
 *
 * algorithms
 * Easy (63.13%)
 * Likes:    819
 * Dislikes: 0
 * Total Accepted:    96.3K
 * Total Submissions: 152.5K
 * Testcase Example:  '[2,2,1]'
 *
 * 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 * 
 * 说明：
 * 
 * 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 * 
 * 示例 1:
 * 
 * 输入: [2,2,1]
 * 输出: 1
 * 
 * 
 * 示例 2:
 * 
 * 输入: [4,1,2,1,2]
 * 输出: 4
 * 
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        // 异或
        // return xor(nums)

        return map(nums
        )
    }

    private func xor(_ nums: [Int]) -> Int { 
        var res = 0
        for num in nums {
            res ^= num
        }
        return res
    }

    private func map(_ nums: [Int]) -> Int { 
        var hashMap: [Int: Int] = [:]

        for i in 0..<nums.count {
            hashMap[nums[i], default: 0] += 1
        }

        for val in hashMap {
            if val.value == 1 {
                return val.key
            }
        }

        return 0
    }
}


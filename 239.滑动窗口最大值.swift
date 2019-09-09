/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 *
 * https://leetcode-cn.com/problems/sliding-window-maximum/description/
 *
 * algorithms
 * Hard (42.33%)
 * Likes:    136
 * Dislikes: 0
 * Total Accepted:    14.2K
 * Total Submissions: 33.5K
 * Testcase Example:  '[1,3,-1,-3,5,3,6,7]\n3'
 *
 * 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k
 * 个数字。滑动窗口每次只向右移动一位。
 * 
 * 返回滑动窗口中的最大值。
 * 
 * 
 * 
 * 示例:
 * 
 * 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 * 输出: [3,3,5,5,6,7] 
 * 解释: 
 * 
 * ⁠ 滑动窗口的位置                最大值
 * ---------------               -----
 * [1  3  -1] -3  5  3  6  7       3
 * ⁠1 [3  -1  -3] 5  3  6  7       3
 * ⁠1  3 [-1  -3  5] 3  6  7       5
 * ⁠1  3  -1 [-3  5  3] 6  7       5
 * ⁠1  3  -1  -3 [5  3  6] 7       6
 * ⁠1  3  -1  -3  5 [3  6  7]      7
 * 
 * 
 * 
 * 提示：
 * 
 * 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。
 * 
 * 
 * 
 * 进阶：
 * 
 * 你能在线性时间复杂度内解决此题吗？
 * 
 */
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // return bruteForce(nums, k)
        return _maxSlidingWindow(nums, k)
    }

    private func _maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        // 维护一个单调栈
        var maxStack: [Int] = []
        var res: [Int] = []

        for i in 0..<nums.count {
            // 移除第一个
            if !maxStack.isEmpty && maxStack[0] == i - k {
                maxStack.removeFirst()
            }

            while !maxStack.isEmpty && nums[maxStack.last!] < nums[i] {
                maxStack.removeLast()
            }

            maxStack.append(nums[i])

            if i >= k - 1 {
                res.append(nums[0])
            }
        }

        return res
    }

    private func bruteForce(_ nums: [Int], _ k: Int) -> [Int] {
        
        guard !nums.isEmpty else { return [] }

        var maxVals: [Int] = []

        for i in 0...nums.count - k {
            var maxVal = nums[i]
            for j in 0..<k {
                maxVal = max(maxVal, nums[i+j])
            }
            maxVals.append(maxVal)
        }

        return maxVals
    }
}


/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 *
 * https://leetcode-cn.com/problems/trapping-rain-water/description/
 *
 * algorithms
 * Hard (46.02%)
 * Likes:    544
 * Dislikes: 0
 * Total Accepted:    23.9K
 * Total Submissions: 51.9K
 * Testcase Example:  '[0,1,0,2,1,0,1,3,2,1,2,1]'
 *
 * 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 * 
 * 
 * 
 * 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢
 * Marcos 贡献此图。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 * 输出: 6
 * 
 */
class Solution {
    func trap(_ height: [Int]) -> Int {
        
        return _trap1(height)
    }

    private func _trap1(_ height: [Int]) -> Int {
        var stack: [Int] = []

        var sum = 0

        for i in 0..<height.count {
            while !stack.isEmpty && height[stack.last!] < height[i] {

                let current = stack.removeLast()

                // removeLast() 如果栈变空说明这个边界，不用计算 
                if stack.isEmpty {
                    break
                }

                let minHeight = min(height[i], height[stack.last!]) // 取当前柱子和需要计算的柱子的前一根柱子的最小值
                let height = minHeight - height[current] // 储水量
                let width = i - 1 - stack.last!
                let area = height * width
                sum += area
            }

            stack.append(i)
        }

        return sum
    }

    private func _trap2(_ height: [Int]) -> Int {
        var maxNum = 0

        var leftMax: [Int] = []

        for i in 0..<height.count {
            leftMax.append(maxNum)
            maxNum = max(maxNum, height[i])
        }

        maxNum = 0

        var rightMax = Array(repeating: 0, count: height.count)

        for i in (0..<height.count).reversed() {
            rightMax[i] = maxNum
            maxNum = max(maxNum, height[i])
        }

        var sum = 0
        for i in 0..<height.count {
            let minNum = min(leftMax[i], rightMax[i])
            if minNum > height[i] {
                sum += minNum - height[i]
            }
        }   

        return sum
    }
}


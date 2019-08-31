/*
 * @lc app=leetcode.cn id=84 lang=swift
 *
 * [84] 柱状图中最大的矩形
 *
 * https://leetcode-cn.com/problems/largest-rectangle-in-histogram/description/
 *
 * algorithms
 * Hard (37.30%)
 * Likes:    244
 * Dislikes: 0
 * Total Accepted:    11.9K
 * Total Submissions: 32K
 * Testcase Example:  '[2,1,5,6,2,3]'
 *
 * 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
 * 
 * 求在该柱状图中，能够勾勒出来的矩形的最大面积。
 * 
 * 
 * 
 * 
 * 
 * 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。
 * 
 * 
 * 
 * 
 * 
 * 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。
 * 
 * 
 * 
 * 示例:
 * 
 * 输入: [2,1,5,6,2,3]
 * 输出: 10
 * 
 */
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var stack: [Int] = []
        var maxArea = 0
        var heights = heights
        heights.append(0)
        for i in 0..<heights.count {
            while !stack.isEmpty && heights[i] < heights[stack.last!] {
                let maxHeight = heights[stack.popLast()!]
                let area = stack.isEmpty ? maxHeight * i : maxHeight * (i-stack.last!-1)
                maxArea = max(maxArea, area)
            }
            stack.append(i)
        }
        return maxArea
    }
}


/*
 * @lc app=leetcode.cn id=88 lang=swift
 *
 * [88] 合并两个有序数组
 *
 * https://leetcode-cn.com/problems/merge-sorted-array/description/
 *
 * algorithms
 * Easy (45.06%)
 * Likes:    301
 * Dislikes: 0
 * Total Accepted:    64.6K
 * Total Submissions: 143.1K
 * Testcase Example:  '[1,2,3,0,0,0]\n3\n[2,5,6]\n3'
 *
 * 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 * 
 * 说明:
 * 
 * 
 * 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 * 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 * 
 * 
 * 示例:
 * 
 * 输入:
 * nums1 = [1,2,3,0,0,0], m = 3
 * nums2 = [2,5,6],       n = 3
 * 
 * 输出: [1,2,2,3,5,6]
 * 
 */
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var lastEmptyIndex = m + n - 1
        var i = m - 1
        var j = n - 1

        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[lastEmptyIndex] = nums1[i]
                i -= 1
            } else {
                nums1[lastEmptyIndex] = nums2[j]
                j -= 1
            }
            lastEmptyIndex -= 1
        }

        while j >= 0 {
            nums1[lastEmptyIndex] = nums2[j]
            j -= 1
            lastEmptyIndex -= 1
        }
    }
}


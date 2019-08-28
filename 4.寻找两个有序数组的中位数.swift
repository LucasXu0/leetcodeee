/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个有序数组的中位数
 *
 * https://leetcode-cn.com/problems/median-of-two-sorted-arrays/description/
 *
 * algorithms
 * Hard (35.86%)
 * Likes:    1427
 * Dislikes: 0
 * Total Accepted:    82.6K
 * Total Submissions: 230.4K
 * Testcase Example:  '[1,3]\n[2]'
 *
 * 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 * 
 * 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 * 
 * 你可以假设 nums1 和 nums2 不会同时为空。
 * 
 * 示例 1:
 * 
 * nums1 = [1, 3]
 * nums2 = [2]
 * 
 * 则中位数是 2.0
 * 
 * 
 * 示例 2:
 * 
 * nums1 = [1, 2]
 * nums2 = [3, 4]
 * 
 * 则中位数是 (2 + 3)/2 = 2.5
 * 
 * 
 */
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // return bruteForce(nums1, nums2)
        return _findMedianSortedArrays(nums1, nums2)
    }

    func _findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return _findMedianSortedArrays(nums2, nums1)
        }

        if nums1.isEmpty {
            return findMedianSortedArray(nums2)
        }

        if nums2.isEmpty {
            return findMedianSortedArray(nums1)
        }

        var low = 0
        var high = nums1.count

        let halfLength = (nums1.count + nums2.count + 1) / 2

        while low <= high {

            let i = low + (high - low) / 2
            let j = halfLength - i

            let nums1LeftMax = (i == 0) ? Int.min : nums1[i - 1]
            let nums1RightMin = (i == nums1.count) ? Int.max : nums1[i]
            let nums2LeftMax = (j == 0) ? Int.min : nums2[j - 1]
            let nums2RightMin = (j == nums2.count) ? Int.max : nums2[j]

            if nums1LeftMax > nums2RightMin {
                high = i - 1
            } else if nums2LeftMax > nums1RightMin {
                low = i + 1
            } else {
                let isEven = ((nums1.count + nums2.count) % 2 == 0)
                if isEven {
                    return Double(max(nums1LeftMax, nums2LeftMax) + min(nums1RightMin, nums2RightMin)) / 2.0
                } else {
                    return Double(max(nums1LeftMax, nums2LeftMax))
                }
            }
        }
        return 0.0
    }

    // 蛮力法 
    private func bruteForce(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // combine two sums to one sums
        // count the sum of combined sums
        // calculate the average of the sum
        // if the average is even -> find two num -> count / 2 - 1
        // if the average is odd -> find single num -> (count - 1) / 2

        var nums = nums1
        nums.append(contentsOf: nums2)
        nums.sort()

        return findMedianSortedArray(nums)
    }

    private func findMedianSortedArray(_ nums: [Int]) -> Double {
        let isEven = (nums.count % 2 == 0)

        if isEven {
            let middle = nums.count / 2
            return Double(nums[middle-1] + nums[middle]) / 2.0
        } else {
            let middle = (nums.count - 1) / 2
            return Double(nums[middle])
        }
    }
}


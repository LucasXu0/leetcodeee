/*
 * @lc app=leetcode.cn id=347 lang=swift
 *
 * [347] 前 K 个高频元素
 *
 * https://leetcode-cn.com/problems/top-k-frequent-elements/description/
 *
 * algorithms
 * Medium (58.03%)
 * Likes:    163
 * Dislikes: 0
 * Total Accepted:    19.9K
 * Total Submissions: 34.2K
 * Testcase Example:  '[1,1,1,2,2,3]\n2'
 *
 * 给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
 * 
 * 示例 1:
 * 
 * 输入: nums = [1,1,1,2,2,3], k = 2
 * 输出: [1,2]
 * 
 * 
 * 示例 2:
 * 
 * 输入: nums = [1], k = 1
 * 输出: [1]
 * 
 * 说明：
 * 
 * 
 * 你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
 * 你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
 * 
 * 
 */
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        // 利用桶排序

        var map: [Int: Int] = [:]

        for num in nums {
            map[num, default: 0] += 1
        }

        var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1) // 0 不是出现的情况，所以桶 + 1

        map.forEach {
            buckets[$0.value].append($0.key)
        }

        var res: [Int] = []
        var i = buckets.count - 1

        while i > 0 {
            if !buckets[i].isEmpty {
                res.append(contentsOf: buckets[i])
            }

            if res.count == k {
                break
            }

            i -= 1
        }

        return res
    }

    // O(n log n)
    private func _topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]

        for num in nums {
            map[num, default: 0] += 1
        }

        var mapArray: [(Int, Int)] = []
        map.forEach {
            mapArray.append(($0.key, $0.value))
        }

        mapArray = mapArray.sorted(by: {
            $0.1 > $1.1
        })

        var res: [Int] = []
        for i in 0..<k {
            res.append(mapArray[i].0)
        }

        return res
    }
}


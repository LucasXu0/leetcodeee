/*
 * @lc app=leetcode.cn id=56 lang=swift
 *
 * [56] 合并区间
 *
 * https://leetcode-cn.com/problems/merge-intervals/description/
 *
 * algorithms
 * Medium (38.03%)
 * Likes:    171
 * Dislikes: 0
 * Total Accepted:    24.8K
 * Total Submissions: 65.1K
 * Testcase Example:  '[[1,3],[2,6],[8,10],[15,18]]'
 *
 * 给出一个区间的集合，请合并所有重叠的区间。
 * 
 * 示例 1:
 * 
 * 输入: [[1,3],[2,6],[8,10],[15,18]]
 * 输出: [[1,6],[8,10],[15,18]]
 * 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 * 
 * 
 * 示例 2:
 * 
 * 输入: [[1,4],[4,5]]
 * 输出: [[1,5]]
 * 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 * 
 */
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sortedIntervals = intervals.sorted(by: {
            $0.first! < $1.first!
        })

        var res: [[Int]] = []

        // new way
        for interval in sortedIntervals {
            if res.isEmpty || res[res.count - 1][1] < interval[0] {
                res.append(interval)
            } else {
                res[res.count - 1][1] = max(res[res.count - 1][1], interval[1])
            }
        }

        // old way
        // for i in 0..<sortedIntervals.count - 1 {
        //     if sortedIntervals[i][1] >= sortedIntervals[i+1][0] {
        //         sortedIntervals[i+1][0] = sortedIntervals[i][0]
        //         sortedIntervals[i+1][1] = max(sortedIntervals[i][1], sortedIntervals[i+1][1])
        //     } else {
        //         res.append(sortedIntervals[i])
        //     }
        // }

        return res
    }
}


/*
 * @lc app=leetcode.cn id=845 lang=swift
 *
 * [845] 数组中的最长山脉
 *
 * https://leetcode-cn.com/problems/longest-mountain-in-array/description/
 *
 * algorithms
 * Medium (31.84%)
 * Likes:    40
 * Dislikes: 0
 * Total Accepted:    2.6K
 * Total Submissions: 8.1K
 * Testcase Example:  '[2,1,4,7,3,2,5]'
 *
 * 我们把数组 A 中符合下列属性的任意连续子数组 B 称为 “山脉”：
 * 
 * 
 * B.length >= 3
 * 存在 0 < i < B.length - 1 使得 B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... >
 * B[B.length - 1]
 * 
 * 
 * （注意：B 可以是 A 的任意子数组，包括整个数组 A。）
 * 
 * 给出一个整数数组 A，返回最长 “山脉” 的长度。
 * 
 * 如果不含有 “山脉” 则返回 0。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：[2,1,4,7,3,2,5]
 * 输出：5
 * 解释：最长的 “山脉” 是 [1,4,7,3,2]，长度为 5。
 * 
 * 
 * 示例 2：
 * 
 * 输入：[2,2,2]
 * 输出：0
 * 解释：不含 “山脉”。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= A.length <= 10000
 * 0 <= A[i] <= 10000
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestMountain(_ arr: [Int]) -> Int {
        
        let n = arr.count 

        if n < 3 { return 0 }
        
        var up = 0
        var down = 0

        var max_len = 0

        for i in 1..<n {

            // 正在下山的时候遇到上坡
            // 两个都要清零
            if down != 0 && arr[i-1] < arr[i] || arr[i-1] == arr[i] {
                up = 0
                down = 0
            }

            if arr[i] > arr[i-1] { up += 1 }
            if arr[i] < arr[i-1] { down += 1 }

            if up != 0 && down != 0 {
                max_len = max(max_len, up + down + 1)
            }
        }

        return max_len
    }
}
// @lc code=end


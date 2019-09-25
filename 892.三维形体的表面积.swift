/*
 * @lc app=leetcode.cn id=892 lang=swift
 *
 * [892] 三维形体的表面积
 *
 * https://leetcode-cn.com/problems/surface-area-of-3d-shapes/description/
 *
 * algorithms
 * Easy (54.31%)
 * Likes:    30
 * Dislikes: 0
 * Total Accepted:    3.4K
 * Total Submissions: 6.2K
 * Testcase Example:  '[[2]]'
 *
 * 在 N * N 的网格上，我们放置一些 1 * 1 * 1  的立方体。
 *
 * 每个值 v = grid[i][j] 表示 v 个正方体叠放在对应单元格 (i, j) 上。
 *
 * 请你返回最终形体的表面积。
 *
 *
 *
 *
 *
 *
 * 示例 1：
 *
 * 输入：[[2]]
 * 输出：10
 *
 *
 * 示例 2：
 *
 * 输入：[[1,2],[3,4]]
 * 输出：34
 *
 *
 * 示例 3：
 *
 * 输入：[[1,0],[0,2]]
 * 输出：16
 *
 *
 * 示例 4：
 *
 * 输入：[[1,1,1],[1,0,1],[1,1,1]]
 * 输出：32
 *
 *
 * 示例 5：
 *
 * 输入：[[2,2,2],[2,1,2],[2,2,2]]
 * 输出：46
 *
 *
 *
 *
 * 提示：
 *
 *
 * 1 <= N <= 50
 * 0 <= grid[i][j] <= 50
 *
 *
 */
class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {

        let n = grid.count

        var res = 0

        for i in 0..<n {
            for j in 0..<n {
                if i == 0 && j == 0 { // both no
                    res += surface(grid[i][j])
                } else if j == 0 { // no top
                    res += cutDuplicatedSurface(grid[i][j], grid[i-1][j], 0)
                } else if i == 0 { // no left
                    res += cutDuplicatedSurface(grid[i][j], 0, grid[i][j-1])
                } else {
                    res += cutDuplicatedSurface(grid[i][j], grid[i-1][j], grid[i][j-1])
                }
            }
        }

        return res
    }

    func surface(_ h: Int) -> Int {
        if h == 0 {
            return 0
        } else {
            return h * 4 + 2
        }
    }

    func cutDuplicatedSurface(_ h: Int, _ top: Int, _ left: Int) -> Int{
        return surface(h) - 2 * min(h, top) - 2 * min(h, left)
    }
}
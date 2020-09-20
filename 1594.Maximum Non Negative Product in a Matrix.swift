class Solution {
    func maxProductPath(_ grid: [[Int]]) -> Int {

        let n = grid.count
        let m = grid[0].count

        // (min, max)
        var dp:[[(Int, Int)]] = Array(repeating: Array(repeating: (0, 0), count: m), count: n)

        for i in 0..<n {
            for j in 0..<m {
                if i == 0, j == 0 {
                    dp[0][0] = (grid[0][0], grid[0][0])
                } else if i == 0 {
                    let p = dp[0][j-1].0 * grid[0][j]
                    dp[0][j] = (p, p)
                } else if j == 0 {
                    let p = dp[i-1][0].0 * grid[i][0]
                    dp[i][0] = (p, p)
                } else {
                    var minv = min(dp[i-1][j].0, dp[i][j-1].0) * grid[i][j] // minv = min(left, top) * cur
                    var maxv = max(dp[i-1][j].1, dp[i][j-1].1) * grid[i][j] // maxv = max(left, top) * cur
                    if minv > maxv { swap(&minv, &maxv) } // swap if minv > maxv
                    dp[i][j] = (minv, maxv)
                }
            }
        }

        if dp[n-1][m-1].1 < 0 { return -1 }
        return dp[n-1][m-1].1 % (Int(1e9 + 7))
    }
}
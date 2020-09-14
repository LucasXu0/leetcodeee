class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        // return bruteForce(mat)
        return optimization(mat)
    }

    private func optimization(_ mat: [[Int]]) -> Int {
        let n = mat.count
        let m = mat[0].count

        var row = Array(repeating: 0, count: n)
        var col = Array(repeating: 0, count: m)

        for i in 0..<n {
            for j in 0..<m {
                if mat[i][j] == 1 {
                    row[i] += 1
                    col[j] += 1
                }
            }
        }

        var res = 0

        for i in 0..<n {
            for j in 0..<m {
                if mat[i][j] == 1, row[i] == 1, col[j] == 1 {
                    res += 1
                }
            }
        }

        return res
    }

    private func bruteForce(_ mat: [[Int]]) -> Int {
        let n = mat.count
        let m = mat[0].count

        var res = 0

        for i in 0..<n {
            for j in 0..<m {
                if mat[i][j] == 1 {
                    var special = true

                    for x in 0..<n {
                        if x == i { continue }
                        if mat[x][j] == 1 {
                            special = false
                            break
                        }
                    }

                    if special == false { break }

                    for x in 0..<m {
                        if x == j { continue }
                        if mat[i][x] == 1 {
                            special = false
                            break
                        }
                    }

                    if special == false { break }

                    res += 1
                }
            }
        }

        return res
    }
}
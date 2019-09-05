/*
 * @lc app=leetcode.cn id=454 lang=swift
 *
 * [454] 四数相加 II
 *
 * https://leetcode-cn.com/problems/4sum-ii/description/
 *
 * algorithms
 * Medium (53.67%)
 * Likes:    79
 * Dislikes: 0
 * Total Accepted:    9K
 * Total Submissions: 16.7K
 * Testcase Example:  '[1,2]\n[-2,-1]\n[-1,2]\n[0,2]'
 *
 * 给定四个包含整数的数组列表 A , B , C , D ,计算有多少个元组 (i, j, k, l) ，使得 A[i] + B[j] + C[k] +
 * D[l] = 0。
 * 
 * 为了使问题简单化，所有的 A, B, C, D 具有相同的长度 N，且 0 ≤ N ≤ 500 。所有整数的范围在 -2^28 到 2^28 - 1
 * 之间，最终结果不会超过 2^31 - 1 。
 * 
 * 例如:
 * 
 * 
 * 输入:
 * A = [ 1, 2]
 * B = [-2,-1]
 * C = [-1, 2]
 * D = [ 0, 2]
 * 
 * 输出:
 * 2
 * 
 * 解释:
 * 两个元组如下:
 * 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
 * 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
 * 
 * 
 */
class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        
        // return bruteForce(A, B, C, D)
        return _fourSumCount(A, B, C, D)
    }

    // combine each two array to one
    func _fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {

        var AB: [Int: Int] = [:]

        for a in A {
            for b in B {
                AB[a+b, default: 0] += 1
            }
        }

        var res = 0 

        for c in C {
            for d in D {
                if let ab = AB[-(c+d)] {
                    res += ab
                }
            }
        }

        return res
    }

    // Time Limit Exceeded
    private func bruteForce(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {

        var res = 0

        for i in 0..<A.count {
            for j in 0..<B.count {
                for k in 0..<C.count {
                    for l in 0..<D.count {
                        if A[i] + B[j] + C[k] + D[l] == 0 {
                            res += 1
                        }
                    }
                }
            }
        }

        return res
    }
}


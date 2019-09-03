/*
 * @lc app=leetcode.cn id=204 lang=swift
 *
 * [204] 计数质数
 *
 * https://leetcode-cn.com/problems/count-primes/description/
 *
 * algorithms
 * Easy (29.77%)
 * Likes:    195
 * Dislikes: 0
 * Total Accepted:    25.9K
 * Total Submissions: 87K
 * Testcase Example:  '10'
 *
 * 统计所有小于非负整数 n 的质数的数量。
 * 
 * 示例:
 * 
 * 输入: 10
 * 输出: 4
 * 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
 * 
 * 
 */
class Solution {
    
    func countPrimes(_ n: Int) -> Int {
        
        var isPrimess = Array(repeating: true, count: n)

        var counter = 0
        
        guard n > 2 else { return counter }

        for i in 2..<n {
            if isPrimess[i] {
                counter += 1
                var j = i
                while j < n {
                    isPrimess[j] = false
                    j += i
                }
            }
        }

        return counter
    }

    private func _countPrimes(_ n: Int) -> Int {
        var counter = 0

        guard n > 2 else { return 0 }

        for i in 2..<n {
            if isPrime(i) {
                counter += 1
            }
        }

        return counter
    }

    private func isPrime(_ n: Int) -> Bool {
        if n == 2 || n == 3 {
            return true
        }

        if n % 6 != 1 && n % 6 != 5 {
            return false
        }

        let sqrt = Int(Double(n).squareRoot())
        guard sqrt > 2 else{
            return true
        }

        for i in 2...sqrt {
            if n % i == 0 {
                return false
            }
        }

        return true
    }
}


/*
 * @lc app=leetcode.cn id=846 lang=swift
 *
 * [846] 一手顺子
 *
 * https://leetcode-cn.com/problems/hand-of-straights/description/
 *
 * algorithms
 * Medium (44.11%)
 * Likes:    29
 * Dislikes: 0
 * Total Accepted:    2.3K
 * Total Submissions: 5.3K
 * Testcase Example:  '[1,2,3,6,2,3,4,7,8]\n3'
 *
 * 爱丽丝有一手（hand）由整数数组给定的牌。 
 * 
 * 现在她想把牌重新排列成组，使得每个组的大小都是 W，且由 W 张连续的牌组成。
 * 
 * 如果她可以完成分组就返回 true，否则返回 false。
 * 
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：hand = [1,2,3,6,2,3,4,7,8], W = 3
 * 输出：true
 * 解释：爱丽丝的手牌可以被重新排列为 [1,2,3]，[2,3,4]，[6,7,8]。
 * 
 * 示例 2：
 * 
 * 输入：hand = [1,2,3,4,5], W = 4
 * 输出：false
 * 解释：爱丽丝的手牌无法被重新排列成几个大小为 4 的组。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= hand.length <= 10000
 * 0 <= hand[i] <= 10^9
 * 1 <= W <= hand.length
 * 
 * 
 */

// @lc code=start
class Solution {
    func isNStraightHand(_ hand: [Int], _ w: Int) -> Bool {
        
        let n = hand.count 

        if n % w != 0 { return false }

        var map: [Int: Int] = [:]

        for ele in hand {
            map[ele, default: 0] += 1
        }

        var cards = Array(map).sorted(by: { $0.key < $1.key })

        for i in 0..<cards.count-w+1{
            let card = cards[i].key
            let cnt = cards[i].value

            if cnt != 0 {
                for j in 0..<w {
                    if cards[i+j].key != card + j { return false }
                    cards[i+j] = (key: cards[i+j].key, value: cards[i+j].value - cnt)
                    if cards[i+j].value < 0 {
                        return false
                    }
                }
            }
        }

        for i in 0..<cards.count {
            if cards[i].value != 0 {
                return false
            }
        }

        return true
    }
}
// @lc code=end


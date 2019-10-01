/*
 * @lc app=leetcode.cn id=872 lang=swift
 *
 * [872] 叶子相似的树
 *
 * https://leetcode-cn.com/problems/leaf-similar-trees/description/
 *
 * algorithms
 * Easy (60.40%)
 * Likes:    39
 * Dislikes: 0
 * Total Accepted:    6.4K
 * Total Submissions: 10.7K
 * Testcase Example:  '[3,5,1,6,2,9,8,null,null,7,4]\n[3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]'
 *
 * 请考虑一颗二叉树上所有的叶子，这些叶子的值按从左到右的顺序排列形成一个 叶值序列 。
 * 
 * 
 * 
 * 举个例子，如上图所示，给定一颗叶值序列为 (6, 7, 4, 9, 8) 的树。
 * 
 * 如果有两颗二叉树的叶值序列是相同，那么我们就认为它们是 叶相似 的。
 * 
 * 如果给定的两个头结点分别为 root1 和 root2 的树是叶相似的，则返回 true；否则返回 false 。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 给定的两颗树可能会有 1 到 100 个结点。
 * 
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        
        func pre_order(_ node: TreeNode?, _ res: inout [Int]) {
            guard let node = node else { return }

            if node.left == nil && node.right == nil {
                res.append(node.val)
            }

            pre_order(node.left, &res)
            pre_order(node.right, &res)
        }

        var leaf1: [Int] = []
        var leaf2: [Int] = []

        pre_order(root1, &leaf1)
        pre_order(root2, &leaf2)

        // print(leaf1)
        // print(leaf2)

        return leaf1 == leaf2
    }
}
// @lc code=end


/*
 * @lc app=leetcode.cn id=111 lang=swift
 *
 * [111] 二叉树的最小深度
 *
 * https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/description/
 *
 * algorithms
 * Easy (40.12%)
 * Likes:    160
 * Dislikes: 0
 * Total Accepted:    31.8K
 * Total Submissions: 79.2K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，找出其最小深度。
 * 
 * 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例:
 * 
 * 给定二叉树 [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 返回它的最小深度  2.
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
    func minDepth(_ root: TreeNode?) -> Int {

        func dfs(_ node: TreeNode?) -> Int {

            guard let node = node else { return 0 }

            if node.left == nil && node.right == nil {
                return 1
            }

            let left = dfs(node.left)
            let right = dfs(node.right)

            if node.left == nil || node.right == nil {
                return left + right + 1
            }

            return min(left, right) + 1
        }

        return dfs(root)
    }

    func min_depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var md = Int.max

        func dfs(_ node: TreeNode?, _ sum: Int) {
            
            guard let node = node else { return }

            if node.left == nil && node.right == nil {
                md = min(md, sum+1)
            } else {
                dfs(node.left, sum+1)
                dfs(node.right, sum+1)
            }
        }

        dfs(root, 0)

        return md
    }
}
// @lc code=end


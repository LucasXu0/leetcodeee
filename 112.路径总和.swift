/*
 * @lc app=leetcode.cn id=112 lang=swift
 *
 * [112] 路径总和
 *
 * https://leetcode-cn.com/problems/path-sum/description/
 *
 * algorithms
 * Easy (47.75%)
 * Likes:    179
 * Dislikes: 0
 * Total Accepted:    31.9K
 * Total Submissions: 66.6K
 * Testcase Example:  '[5,4,8,11,null,13,4,7,2,null,null,null,1]\n22'
 *
 * 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例: 
 * 给定如下二叉树，以及目标和 sum = 22，
 * 
 * ⁠             5
 * ⁠            / \
 * ⁠           4   8
 * ⁠          /   / \
 * ⁠         11  13  4
 * ⁠        /  \      \
 * ⁠       7    2      1
 * 
 * 
 * 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {

        guard let root = root else { return false }

        var sum = sum - root.val

        if root.left == nil && root.right == nil {
            return sum == 0
        }

        return hasPathSum(root.left, sum) || hasPathSum(root.right, sum
        )
    }

    func has_path_sum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        
        var sums: [Int] = []

        func dfs(_ node: TreeNode, _ sum: Int) {
        
            if node.left == nil && node.right == nil {
                sums.append(sum+node.val)
            } else {
                if let left = node.left {
                    dfs(left, sum+node.val)
                }

                if let right = node.right {
                    dfs(right, sum+node.val)
                }
            }
        }

        dfs(root, 0)

        return sums.contains(sum)
    }   
}
// @lc code=end


/*
 * @lc app=leetcode.cn id=124 lang=swift
 *
 * [124] 二叉树中的最大路径和
 *
 * https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/description/
 *
 * algorithms
 * Hard (37.81%)
 * Likes:    218
 * Dislikes: 0
 * Total Accepted:    15.3K
 * Total Submissions: 40.4K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个非空二叉树，返回其最大路径和。
 * 
 * 本题中，路径被定义为一条从树中任意节点出发，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
 * 
 * 示例 1:
 * 
 * 输入: [1,2,3]
 * 
 * ⁠      1
 * ⁠     / \
 * ⁠    2   3
 * 
 * 输出: 6
 * 
 * 
 * 示例 2:
 * 
 * 输入: [-10,9,20,null,null,15,7]
 * 
 * -10
 * / \
 * 9  20
 * /  \
 * 15   7
 * 
 * 输出: 42
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

    private var maxSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _maxPathSum(root)
        return maxSum   
    }

    func _maxPathSum(_ root: TreeNode?) -> Int {

        guard let root = root else { return 0 }

        let leftMax = max(_maxPathSum(root.left), 0)
        let rightMax = max(_maxPathSum(root.right), 0)

        maxSum = max(maxSum, root.val + leftMax + rightMax)

        return root.val + max(leftMax, rightMax)
    }
}
// @lc code=end


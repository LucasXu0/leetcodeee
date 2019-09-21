/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层次遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (58.63%)
 * Likes:    278
 * Dislikes: 0
 * Total Accepted:    45.8K
 * Total Submissions: 78K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 * 
 * 例如:
 * 给定二叉树: [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 返回其层次遍历结果：
 * 
 * [
 * ⁠ [3],
 * ⁠ [9,20],
 * ⁠ [15,7]
 * ]
 * 
 * 
 */
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var res: [[Int]] = []

        func helper(_ node: TreeNode, _ level: Int) {
            if res.count == level {
                res.append([])
            }

            res[level].append(node.val)

            if let left = node.left {
                helper(left, level + 1)
            }

            if let right = node.right {
                helper(right, level + 1)
            }
        }

        if let root = root {
            helper(root, 0)
        }
    
        return res
    }
}


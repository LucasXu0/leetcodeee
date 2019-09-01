/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
 *
 * algorithms
 * Medium (67.68%)
 * Likes:    263
 * Dislikes: 0
 * Total Accepted:    53.9K
 * Total Submissions: 79.7K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的中序 遍历。
 * 
 * 示例:
 * 
 * 输入: [1,null,2,3]
 * ⁠  1
 * ⁠   \
 * ⁠    2
 * ⁠   /
 * ⁠  3
 * 
 * 输出: [1,3,2]
 * 
 * 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // return inorder(root)   
        return _inorder(root)
    }

    // 迭代
    private func _inorder(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var res: [Int] = []
    
        var cur = root
        
        while cur != nil || !stack.isEmpty {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }

            cur = stack.removeLast()
            res.append(cur!.val)
            cur = cur?.right
        }

        return res
    }

    // 中序遍历 左->中->右
    // 递归
    private func inorder(_ root: TreeNode?) -> [Int] {

        guard let root = root else { return [] }

        var res: [Int] = []
        res.append(contentsOf: inorder(root.left))
        res.append(root.val)
        res.append(contentsOf: inorder(root.right))
        return res
    }
}


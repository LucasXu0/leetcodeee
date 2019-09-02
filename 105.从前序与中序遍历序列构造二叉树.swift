/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (60.79%)
 * Likes:    223
 * Dislikes: 0
 * Total Accepted:    21.7K
 * Total Submissions: 35.6K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        var inorderMap: [Int: Int] = [:]

        for i in 0..<inorder.count {
            inorderMap[inorder[i]] = i
        }

        var preorder = preorder

        return _buildTree(&preorder, inorder, 0, inorder.count - 1, inorderMap)
    }

    func _buildTree(_ preorder: inout [Int], _ inorder: [Int], _ left: Int, _ right: Int, _ inorderMap: [Int: Int]) -> TreeNode? {
        guard !preorder.isEmpty && left <= right else { return nil }

        let first = preorder.removeFirst()
        let rootInInorderIndex = inorderMap[first]!

        let root = TreeNode(first)

        root.left = _buildTree(&preorder, inorder, left, rootInInorderIndex - 1, inorderMap)
        root.right = _buildTree(&preorder, inorder, rootInInorderIndex + 1, right, inorderMap)

        return root
    }
}


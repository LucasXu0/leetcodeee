/*
 * @lc app=leetcode.cn id=106 lang=swift
 *
 * [106] 从中序与后序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/
 *
 * algorithms
 * Medium (64.59%)
 * Likes:    119
 * Dislikes: 0
 * Total Accepted:    14.8K
 * Total Submissions: 23K
 * Testcase Example:  '[9,3,15,20,7]\n[9,15,7,20,3]'
 *
 * 根据一棵树的中序遍历与后序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 中序遍历 inorder = [9,3,15,20,7]
 * 后序遍历 postorder = [9,15,7,20,3]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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

    private var inorderMap: [Int: Int] = [:]

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        if inorder.isEmpty { return nil }

        for i in 0..<inorder.count {
            inorderMap[inorder[i]] = i
        }

        var postorder = postorder
        return _buildTree(&postorder, 0, postorder.count - 1)
    }

    func _buildTree(_ postorder: inout [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right || postorder.isEmpty { return nil }

        let val = postorder.removeLast()
        let root = TreeNode(val)

        let inorderIndex = inorderMap[val]!

        root.right = _buildTree(&postorder, inorderIndex + 1, right)
        root.left = _buildTree(&postorder, left, inorderIndex - 1)

        return root
    }
}
// @lc code=end


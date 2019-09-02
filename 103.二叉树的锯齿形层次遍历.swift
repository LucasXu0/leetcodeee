/*
 * @lc app=leetcode.cn id=103 lang=swift
 *
 * [103] 二叉树的锯齿形层次遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/description/
 *
 * algorithms
 * Medium (51.35%)
 * Likes:    90
 * Dislikes: 0
 * Total Accepted:    16.9K
 * Total Submissions: 32.9K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 * 
 * 例如：
 * 给定二叉树 [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 返回锯齿形层次遍历如下：
 * 
 * [
 * ⁠ [3],
 * ⁠ [20,9],
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        return zigzagLevelOrderByQueue(root)
    }

    private func zigzagLevelOrderByQueue(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []

        guard let root = root else { return res }

        var queue: [TreeNode?] = [root, nil]
        var isEven = false
        var tmp: [Int] = []

        while !queue.isEmpty {

            if let first = queue.removeFirst() {
                
                tmp.append(first.val)
                if let left = first.left { queue.append(left) }
                if let right = first.right { queue.append(right) }

            } else {
                // 偶数需要旋转 
                if isEven { tmp.reverse() }

                res.append(tmp)
                tmp = []
                isEven = !isEven

                // 插入 nil 代表终结
                if !queue.isEmpty { queue.append(nil) }
            }
        }

        return res
    }
}


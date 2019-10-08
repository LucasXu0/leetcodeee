/*
 * @lc app=leetcode.cn id=199 lang=swift
 *
 * [199] 二叉树的右视图
 *
 * https://leetcode-cn.com/problems/binary-tree-right-side-view/description/
 *
 * algorithms
 * Medium (61.28%)
 * Likes:    102
 * Dislikes: 0
 * Total Accepted:    10.3K
 * Total Submissions: 16.8K
 * Testcase Example:  '[1,2,3,null,5,null,4]'
 *
 * 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 * 
 * 示例:
 * 
 * 输入: [1,2,3,null,5,null,4]
 * 输出: [1, 3, 4]
 * 解释:
 * 
 * ⁠  1            <---
 * ⁠/   \
 * 2     3         <---
 * ⁠\     \
 * ⁠ 5     4       <---
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var res: [Int] = []

        func helper(_ node: TreeNode?, _ level: Int, _ res: inout [Int]) {

            guard let node = node else { return }

            if res.count == level { res.append(node.val) }

            helper(node.right, level + 1, &res)
            helper(node.left, level + 1, &res)
        }

        helper(root, 0, &res)

        return res
    }
}
// @lc code=end


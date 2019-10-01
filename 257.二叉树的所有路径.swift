/*
 * @lc app=leetcode.cn id=257 lang=swift
 *
 * [257] 二叉树的所有路径
 *
 * https://leetcode-cn.com/problems/binary-tree-paths/description/
 *
 * algorithms
 * Easy (59.79%)
 * Likes:    161
 * Dislikes: 0
 * Total Accepted:    15.9K
 * Total Submissions: 26.5K
 * Testcase Example:  '[1,2,3,null,5]'
 *
 * 给定一个二叉树，返回所有从根节点到叶子节点的路径。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例:
 * 
 * 输入:
 * 
 * ⁠  1
 * ⁠/   \
 * 2     3
 * ⁠\
 * ⁠ 5
 * 
 * 输出: ["1->2->5", "1->3"]
 * 
 * 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        var res: [String] = []

        func dfs(_ node: TreeNode, _ path: String) {
            
            var path = path.appending("\(node.val)")

            if node.left == nil && node.right == nil {
                res.append(path)
            } else {
                path.append("->")
                if let left = node.left {
                    dfs(left, path)
                }
                if let right = node.right {
                    dfs(right, path)
                }
            }
        }

        if let root = root {
            dfs(root, "")
        }
        
        return res
    }
}
// @lc code=end


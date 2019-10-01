/*
 * @lc app=leetcode.cn id=897 lang=swift
 *
 * [897] 递增顺序查找树
 *
 * https://leetcode-cn.com/problems/increasing-order-search-tree/description/
 *
 * algorithms
 * Easy (61.08%)
 * Likes:    37
 * Dislikes: 0
 * Total Accepted:    4.6K
 * Total Submissions: 7.5K
 * Testcase Example:  '[5,3,6,2,4,null,8,1,null,null,null,7,9]'
 *
 * 给定一个树，按中序遍历重新排列树，使树中最左边的结点现在是树的根，并且每个结点没有左子结点，只有一个右子结点。
 * 
 * 
 * 
 * 示例 ：
 * 
 * 输入：[5,3,6,2,4,null,8,1,null,null,null,7,9]
 * 
 * ⁠      5
 * ⁠     / \
 * ⁠   3    6
 * ⁠  / \    \
 * ⁠ 2   4    8
 * /        / \ 
 * 1        7   9
 * 
 * 输出：[1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
 * 
 * ⁠1
 * \
 * 2
 * \
 * 3
 * \
 * 4
 * \
 * 5
 * \
 * 6
 * \
 * 7
 * \
 * 8
 * \
 * ⁠                9  
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 给定树中的结点数介于 1 和 100 之间。
 * 每个结点都有一个从 0 到 1000 范围内的唯一整数值。
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        
        var arr: [Int] = []

        func in_order(_ node: TreeNode?) {
            guard let node = node else { return }

            in_order(node.left)
            arr.append(node.val)
            in_order(node.right)
        }

        in_order(root)

        var pre = TreeNode(0)
        var head = pre
        
        for ele in arr {
            let node = TreeNode(ele)
            pre.right = node
            pre = node
        }

        return head.right
    }
}
// @lc code=end


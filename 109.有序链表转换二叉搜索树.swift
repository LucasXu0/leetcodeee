/*
 * @lc app=leetcode.cn id=109 lang=swift
 *
 * [109] 有序链表转换二叉搜索树
 *
 * https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree/description/
 *
 * algorithms
 * Medium (68.31%)
 * Likes:    104
 * Dislikes: 0
 * Total Accepted:    11.4K
 * Total Submissions: 16.6K
 * Testcase Example:  '[-10,-3,0,5,9]'
 *
 * 给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
 * 
 * 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 * 
 * 示例:
 * 
 * 给定的有序链表： [-10, -3, 0, 5, 9],
 * 
 * 一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
 * 
 * ⁠     0
 * ⁠    / \
 * ⁠  -3   9
 * ⁠  /   /
 * ⁠-10  5
 * 
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        
        var sortedArr: [Int] = []

        var head = head
        while head != nil {
            sortedArr.append(head!.val)
            head = head!.next
        }

        return convert_sorted_array_to_bst(sortedArr, 0, sortedArr.count - 1)
    }

    func convert_sorted_array_to_bst(_ arr: [Int], _ left: Int, _ right: Int) -> TreeNode? {

        if left > right { return nil }

        let mid = (left + right) / 2

        let root = TreeNode(arr[mid])

        root.left = convert_sorted_array_to_bst(arr, left, mid - 1)
        root.right = convert_sorted_array_to_bst(arr, mid + 1, right)

        return root
    }
}
// @lc code=end


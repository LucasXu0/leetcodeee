/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 *
 * https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (56.88%)
 * Likes:    608
 * Dislikes: 0
 * Total Accepted:    106.3K
 * Total Submissions: 186.5K
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
 * 
 * 示例：
 * 
 * 输入：1->2->4, 1->3->4
 * 输出：1->1->2->3->4->4
 * 
 * 
 */
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
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var pre: ListNode? = ListNode(0)
        var cur = pre
        
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                cur?.next = l2
                l2 = l2!.next
            } else {
                cur?.next = l1
                l1 = l1!.next
            }

            cur = cur?.next
        }

        while l1 != nil {
            cur?.next = l1
            l1 = l1?.next
            cur = cur?.next
        }

        while l2 != nil {
            cur?.next = l2
            l2 = l2?.next
            cur = cur?.next
        }

        return pre?.next
    }
}


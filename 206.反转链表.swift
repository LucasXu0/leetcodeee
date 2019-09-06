/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 *
 * https://leetcode-cn.com/problems/reverse-linked-list/description/
 *
 * algorithms
 * Easy (64.10%)
 * Likes:    555
 * Dislikes: 0
 * Total Accepted:    92.8K
 * Total Submissions: 144.6K
 * Testcase Example:  '[1,2,3,4,5]'
 *
 * 反转一个单链表。
 * 
 * 示例:
 * 
 * 输入: 1->2->3->4->5->NULL
 * 输出: 5->4->3->2->1->NULL
 * 
 * 进阶:
 * 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        // return _reverseList(head)
        return _reverseList_recursion(head)
    }

    private func _reverseList_recursion(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }

        let res = _reverseList_recursion(head?.next)
        head?.next?.next = head
        head?.next = nil
        return res
    }

    private func _reverseList(_ head: ListNode?) -> ListNode? {

        var pre: ListNode? = nil
        var cur = head

        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }

        return pre
    }
}


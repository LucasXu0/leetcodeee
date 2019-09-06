/*
 * @lc app=leetcode.cn id=234 lang=swift
 *
 * [234] 回文链表
 *
 * https://leetcode-cn.com/problems/palindrome-linked-list/description/
 *
 * algorithms
 * Easy (38.61%)
 * Likes:    262
 * Dislikes: 0
 * Total Accepted:    37.2K
 * Total Submissions: 96.1K
 * Testcase Example:  '[1,2]'
 *
 * 请判断一个链表是否为回文链表。
 * 
 * 示例 1:
 * 
 * 输入: 1->2
 * 输出: false
 * 
 * 示例 2:
 * 
 * 输入: 1->2->2->1
 * 输出: true
 * 
 * 
 * 进阶：
 * 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        return bruteForce(head)
    }

    private func bruteForce(_ head: ListNode?) -> Bool {
        var cur = head
        var reversedCur = reverseList(copyList(head))

        while cur != nil && reversedCur != nil {
            if cur!.val != reversedCur!.val {
                return false
            }

            cur = cur!.next
            reversedCur = reversedCur!.next
        }

        return true
    }

    private func reverseList(_ head: ListNode?) -> ListNode? {

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

    private func copyList(_ head: ListNode?) -> ListNode? {
        let pre: ListNode? = ListNode(0)
        var node: ListNode? = pre

        var cur = head
        while cur != nil {
            node?.next = ListNode(cur!.val)
            node = node!.next
            cur = cur!.next
        }

        return pre?.next
    }
}


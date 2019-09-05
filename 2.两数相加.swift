/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 *
 * https://leetcode-cn.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (35.49%)
 * Likes:    2988
 * Dislikes: 0
 * Total Accepted:    200.2K
 * Total Submissions: 563.2K
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 * 
 * 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 * 
 * 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 * 
 * 示例：
 * 
 * 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 * 输出：7 -> 0 -> 8
 * 原因：342 + 465 = 807
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1 = l1
        var l2 = l2
        var root = ListNode(0)
        var next = root

        var sum = 0
        while l1 != nil || l2 != nil {

            sum /= 10

            if l1 != nil {
                sum += l1!.val
                l1 = l1!.next
            }

            if l2 != nil {
                sum += l2!.val
                l2 = l2!.next
            }

            next.next = ListNode(sum % 10)
            next = next.next!
        }

        if sum / 10 == 1 {
            next.next = ListNode(1)
        }

        return root.next
    }
}


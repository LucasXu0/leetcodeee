/*
 * @lc app=leetcode.cn id=23 lang=swift
 *
 * [23] 合并K个排序链表
 *
 * https://leetcode-cn.com/problems/merge-k-sorted-lists/description/
 *
 * algorithms
 * Hard (47.43%)
 * Likes:    325
 * Dislikes: 0
 * Total Accepted:    40.4K
 * Total Submissions: 85.3K
 * Testcase Example:  '[[1,4,5],[1,3,4],[2,6]]'
 *
 * 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 * 
 * 示例:
 * 
 * 输入:
 * [
 * 1->4->5,
 * 1->3->4,
 * 2->6
 * ]
 * 输出: 1->1->2->3->4->4->5->6
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        guard !lists.isEmpty else { return nil }

        var lists =  lists

        while lists.count > 1 {
            let res = mergeTwoLists(lists.removeFirst(), lists.removeFirst())
            lists.append(res)
        }

        return lists[0]
    }

    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
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


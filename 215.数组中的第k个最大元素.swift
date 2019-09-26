/*
 * @lc app=leetcode.cn id=215 lang=swift
 *
 * [215] 数组中的第K个最大元素
 *
 * https://leetcode-cn.com/problems/kth-largest-element-in-an-array/description/
 *
 * algorithms
 * Medium (58.14%)
 * Likes:    252
 * Dislikes: 0
 * Total Accepted:    43.9K
 * Total Submissions: 75.5K
 * Testcase Example:  '[3,2,1,5,6,4]\n2'
 *
 * 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 * 
 * 示例 1:
 * 
 * 输入: [3,2,1,5,6,4] 和 k = 2
 * 输出: 5
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 * 输出: 4
 * 
 * 说明: 
 * 
 * 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 * 
 */
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // return bruteForce(nums, k)
        var nums = nums
        return top_kth_partition(&nums, nums.count - k)
    }

    func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {

        if left == right {
            return left
        }

        let pi = arr[right]
        
        var i = left
        
        for j in left..<right {
            if arr[j] < pi {
                arr.swapAt(i, j)
                i += 1
            }
        }

        arr.swapAt(i, right)

        return i
    }

    func top_kth_partition(_ nums: inout [Int], _ k: Int) -> Int {

        var left = 0
        var right = nums.count - 1

        while left <= right {
            let pi = partition(&nums, left, right)

            if pi == k {
                return nums[pi]
            } else if pi > k {
                right = pi - 1
            } else {
                left = pi + 1
            }
        }

        return nums[k]
    }

    private func _findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>(sort: <)

        for i in 0..<nums.count {
            heap.add(nums[i])

            if i > k {
                heap.poll()
            }
        }

        return heap.poll()!
    }

    private func bruteForce(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted(by: >)[k-1]
    }
}

public struct Heap<T> {

    var nodes = [T]()

    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }

    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }

    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }

    @discardableResult public mutating func poll() -> T? {
        return self.remove()
    }

    public mutating func add(_ value: T) {
        self.insert(value)
    }

    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }

    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }

    public func peek() -> T? {
        return nodes.first
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }

    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }

        remove(at: i)
        insert(value)
    }

    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }

    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }

    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }

}

extension Heap where T: Equatable {

    public func index(of node: T) -> Int? {
        return nodes.firstIndex(where: { $0 == node })
    }

    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }

}

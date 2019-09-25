/*
 * @lc app=leetcode.cn id=703 lang=swift
 *
 * [703] 数据流中的第K大元素
 *
 * https://leetcode-cn.com/problems/kth-largest-element-in-a-stream/description/
 *
 * algorithms
 * Easy (39.95%)
 * Likes:    75
 * Dislikes: 0
 * Total Accepted:    8.2K
 * Total Submissions: 20.2K
 * Testcase Example:  '["KthLargest","add","add","add","add","add"]\n[[3,[4,5,8,2]],[3],[5],[10],[9],[4]]'
 *
 * 设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。
 * 
 * 你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用
 * KthLargest.add，返回当前数据流中第K大的元素。
 * 
 * 示例:
 * 
 * 
 * int k = 3;
 * int[] arr = [4,5,8,2];
 * KthLargest kthLargest = new KthLargest(3, arr);
 * kthLargest.add(3);   // returns 4
 * kthLargest.add(5);   // returns 5
 * kthLargest.add(10);  // returns 5
 * kthLargest.add(9);   // returns 8
 * kthLargest.add(4);   // returns 8
 * 
 * 
 * 说明: 
 * 你可以假设 nums 的长度≥ k-1 且k ≥ 1。
 * 
 */

class KthLargest {

    private var minHeap = Heap<Int>(sort: <)
    private var k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k

        for num in nums {
            self.add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        minHeap.add(val)

        if minHeap.count > k {
            minHeap.poll()
        }

        return minHeap.peek()!
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
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

    public mutating func add<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        self.insert(sequence)
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
        return nodes.firstIndex { (f) -> Bool in
            return f == node
        }
    }

    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }

}
/*
 * @lc app=leetcode.cn id=264 lang=swift
 *
 * [264] 丑数 II
 *
 * https://leetcode-cn.com/problems/ugly-number-ii/description/
 *
 * algorithms
 * Medium (47.24%)
 * Likes:    142
 * Dislikes: 0
 * Total Accepted:    9.4K
 * Total Submissions: 19.8K
 * Testcase Example:  '10'
 *
 * 编写一个程序，找出第 n 个丑数。
 *
 * 丑数就是只包含质因数 2, 3, 5 的正整数。
 *
 * 示例:
 *
 * 输入: n = 10
 * 输出: 12
 * 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 *
 * 说明:
 *
 *
 * 1 是丑数。
 * n 不超过1690。
 *
 *
 */
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        // return nth_ugly_number_heap(n)
        return nth_ugly_number_dp(n)
    }

    // 利用堆排序
    // 每次取堆顶元素来乘 2/3/5
    // 然后将结果放入堆中
    // ...
    // 循环 N - 1 次
    func nth_ugly_number_heap(_ n: Int) -> Int {

        var minHeap = Heap<Int>(sort: <)

        minHeap.add(1)

        for _ in 1..<n {
            let top = minHeap.poll()!
            // remove duplicated elements
            while !minHeap.isEmpty, top == minHeap.peek()! {
                minHeap.poll()
            }
            minHeap.add([2*top, 3*top, 5*top])
        }

        return minHeap.peek()!
    }

    // dp
    // dp[i] = min(2*dp[last_2], 3*dp[last_3], 5*dp[last_5])
    func nth_ugly_number_dp(_ n: Int) -> Int {

        var dp = Array(repeating: 0, count: n)

        dp[0] = 1

        var last_2 = 0
        var last_3 = 0
        var last_5 = 0

        for i in 1..<n {
            let d2 = 2*dp[last_2]
            let d3 = 3*dp[last_3]
            let d5 = 5*dp[last_5]
            dp[i] = min(min(d2, d3), d5)
            
            if dp[i] >= 2 * dp[last_2] {
                last_2 += 1
            }
            
            if dp[i] >= 3 * dp[last_3] {
                last_3 += 1
            }

            if dp[i] >= 5 * dp[last_5] {
                last_5 += 1
            }
        }

        return dp[n-1]
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
        return nodes.firstIndex(where: { $0 == node })
    }

    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }

}

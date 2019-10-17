/*
 * @lc app=leetcode.cn id=857 lang=swift
 *
 * [857] 雇佣 K 名工人的最低成本
 *
 * https://leetcode-cn.com/problems/minimum-cost-to-hire-k-workers/description/
 *
 * algorithms
 * Hard (37.12%)
 * Likes:    22
 * Dislikes: 0
 * Total Accepted:    469
 * Total Submissions: 1.2K
 * Testcase Example:  '[10,20,5]\n[70,50,30]\n2'
 *
 * 有 N 名工人。 第 i 名工人的工作质量为 quality[i] ，其最低期望工资为 wage[i] 。
 * 
 * 现在我们想雇佣 K 名工人组成一个工资组。在雇佣 一组 K 名工人时，我们必须按照下述规则向他们支付工资：
 * 
 * 
 * 对工资组中的每名工人，应当按其工作质量与同组其他工人的工作质量的比例来支付工资。
 * 工资组中的每名工人至少应当得到他们的最低期望工资。
 * 
 * 
 * 返回组成一个满足上述条件的工资组至少需要多少钱。
 * 
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入： quality = [10,20,5], wage = [70,50,30], K = 2
 * 输出： 105.00000
 * 解释： 我们向 0 号工人支付 70，向 2 号工人支付 35。
 * 
 * 示例 2：
 * 
 * 输入： quality = [3,1,10,10,1], wage = [4,8,2,2,7], K = 3
 * 输出： 30.66667
 * 解释： 我们向 0 号工人支付 4，向 2 号和 3 号分别支付 13.33333。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= K <= N <= 10000，其中 N = quality.length = wage.length
 * 1 <= quality[i] <= 10000
 * 1 <= wage[i] <= 10000
 * 与正确答案误差在 10^-5 之内的答案将被视为正确的。
 * 
 * 
 */

// @lc code=start
class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        
        let combine = Array(zip(quality, wage)).sorted(by: {
            Double($0.1) / Double($0.0) < Double($1.1) / Double($1.0) 
        })

        var maxHeap = Heap<Int>(sort: >)

        var res: Double = 1e9
        var sum = 0
        for ele in combine {
            sum += ele.0
            maxHeap.add(ele.0)

            if maxHeap.count > k {
                sum -= maxHeap.poll()!
            }

            if maxHeap.count == k {
                let price: Double = Double(ele.1) / Double(ele.0)
                res = min(res, Double(sum) * price)
            }
        }

        return res
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
// @lc code=end


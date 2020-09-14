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

class Solution {
    var rank: [Int] = []
    var uf: [Int] = []

    func union(_ x: Int, _ y: Int) -> Bool {
        let x = find(x)
        let y = find(y)

        if x == y { return false }

        if rank[x] > rank[y] {
            uf[y] = x
        } else if rank[x] < rank[y] {
            uf[x] = y
        } else {
            uf[x] = y
            rank[y] += 1
        }
        return true
    }

    func find(_ x: Int) -> Int {
        if x != uf[x] {
            uf[x] = find(uf[x])
        }
        return uf[x]
    }

    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        // return kruskal(points)
        return prim(points)
    }

    func kruskal(_ points: [[Int]]) -> Int {
        let n = points.count

        uf = Array(0..<n)
        rank = Array(repeating: 1, count: n)

        var arr: [(Int, Int, Int)] = []

        for i in 0..<n {
            for j in i+1..<n {
                let distance = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                arr.append((distance, i, j))
            }
        }

        arr.sort { $0.0 > $1.0 }

        var count = 0
        var res = 0

        while count < n - 1 {
            let edge = arr.removeLast()
            if find(edge.1) != find(edge.2) { // 如果两点没有相连
                res += edge.0
                count += 1
                union(edge.1, edge.2)
            }
        }

        return res
    }

    func prim(_ points: [[Int]]) -> Int {
        let n = points.count

        var res = 0
        var used: [[Int]: Bool] = [:]
        var miniHeap = Heap<(Int, [Int])>(array: [(0, points[0])]) { $0.0 < $1.0 }

        while !miniHeap.isEmpty && used.count < n {
            let top = miniHeap.remove()!
            let distacne = top.0
            let cur = top.1
            if used[cur] == true { continue }
            used[cur] = true

            for point in points {
                if used[point] != true {
                    miniHeap.insert((abs(point[0] - top.1[0]) + abs(point[1] - top.1[1]), point))
                }
            }

            res += distacne
        }

        return res
    }
}

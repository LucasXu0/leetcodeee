class Solution {

    var visited = Set<String>()
    var res = 0;

    func maxUniqueSplit(_ s: String) -> Int {
        dfs(Array(s), &visited, 0)
        return res
    }

    private func dfs(_ s: [Character], _ visited: inout Set<String>, _ start: Int) {
        res = max(res, visited.count)
        var i = start
        while i < s.count {
            i += 1
            let pre = String(s[start..<i])
            if visited.contains(pre) { continue }
            visited.insert(pre)
            dfs(s, &visited, i)
            visited.remove(pre)
        }
    }
}
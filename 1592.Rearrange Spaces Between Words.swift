class Solution {
    func reorderSpaces(_ text: String) -> String {

        let space = text.reduce(0, { $0 + ($1 == " " ? 1 : 0) })
        let words = text.split(separator: " ")
        let n = words.count
        if n == 1 { return words[0] + String(repeating: " ", count: space) }
        let (p, q) = (space / (n - 1), space % (n - 1))
        return words.joined(separator: String(repeating: " ", count: p)) + String(repeating: " ", count: q)
        
//         var space = 0 // 空格数量
//         var words: [String] = [] // 单词集合

//         var cur = ""

//         for c in text {
//             if c == " " {
//                 space += 1
//                 if !cur.isEmpty { words.append(cur) }
//                 cur = ""
//             } else {
//                 cur.append(c)
//             }
//         }

//         if !cur.isEmpty { words.append(cur) } // 边缘条件下的 "   abc", 后面没有空格所以上面的 for 循环不会加

//         if words.count == 1 { return words[0] + String(repeating: " ", count: space) }

//         let n = words.count
//         let p = space / (n - 1)
//         let q = space % (n - 1)

//         var res = ""

//         for i in 0..<n {
//             res += words[i]
//             if i != n - 1 {
//                 res += String(repeating: " ", count: p)
//             } else {
//                 res += String(repeating: " ", count: q)
//             }
//         }

//         return res
    }
}
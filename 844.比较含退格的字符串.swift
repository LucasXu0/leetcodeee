/*
 * @lc app=leetcode.cn id=844 lang=swift
 *
 * [844] 比较含退格的字符串
 *
 * https://leetcode-cn.com/problems/backspace-string-compare/description/
 *
 * algorithms
 * Easy (48.56%)
 * Likes:    64
 * Dislikes: 0
 * Total Accepted:    9.8K
 * Total Submissions: 20.2K
 * Testcase Example:  '"ab#c"\n"ad#c"'
 *
 * 给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：S = "ab#c", T = "ad#c"
 * 输出：true
 * 解释：S 和 T 都会变成 “ac”。
 * 
 * 
 * 示例 2：
 * 
 * 输入：S = "ab##", T = "c#d#"
 * 输出：true
 * 解释：S 和 T 都会变成 “”。
 * 
 * 
 * 示例 3：
 * 
 * 输入：S = "a##c", T = "#a#c"
 * 输出：true
 * 解释：S 和 T 都会变成 “c”。
 * 
 * 
 * 示例 4：
 * 
 * 输入：S = "a#c", T = "b"
 * 输出：false
 * 解释：S 会变成 “c”，但 T 仍然是 “b”。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= S.length <= 200
 * 1 <= T.length <= 200
 * S 和 T 只含有小写字母以及字符 '#'。
 * 
 * 
 * 
 * 
 */

// @lc code=start
class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var ss = Array(s)
        var ts = Array(t)

        var s_stack: [Character] = []
        var t_stack: [Character] = []

        for c in ss {
            if c == "#" {
                if !s_stack.isEmpty { s_stack.removeLast() }
            } else {
                s_stack.append(c)
            }
        }

        for c in ts {
            if c == "#" {
                if !t_stack.isEmpty { t_stack.removeLast() } 
            } else {
                t_stack.append(c)
            }
        }

        return s_stack == t_stack
    }
}
// @lc code=end


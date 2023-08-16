/**
 * 20. 有效的括号
提示
简单
4.1K
相关企业
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
每个右括号都有一个对应的相同类型的左括号。
 

示例 1：

输入：s = "()"
输出：true
示例 2：

输入：s = "()[]{}"
输出：true
示例 3：

输入：s = "(]"
输出：false
 

提示：

1 <= s.length <= 104
s 仅由括号 '()[]{}' 组成
https://leetcode.cn/problems/valid-parentheses/
 */

void main(List<String> args) {
  print(isValid("([]{(})[]{})"));
}

bool isValid(String s) {
  Map key = {")": "(", "]": "[", "}": "{"};
  // 用一个栈存储单个字符，依次入栈，比较栈尾如果成对就出栈，否则入栈, 看最后栈中是否还有值，如果有则不是
  List<String> stack = [];
  for (var i = 0; i < s.length; i++) {
    String char = s[i];
    if (stack.isNotEmpty && stack.last == key[char]) {
      stack.removeLast();
    } else {
      stack.add(char);
    }
  }

  return stack.isEmpty;
}

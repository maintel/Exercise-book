import 'dart:math';

/**
 * 14. 最长公共前缀
简单
2.9K
相关企业
编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

 

示例 1：

输入：strs = ["flower","flow","flight"]
输出："fl"
示例 2：

输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。
 

提示：

1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] 仅由小写英文字母组成
https://leetcode.cn/problems/longest-common-prefix/
 */

void main(List<String> args) {
  print(longestCommonPrefix(["ab", "a"]));
}

String longestCommonPrefix(List<String> strs) {
  String ans = strs[0];
  if (ans == "") {
    return ans;
  }
  for (var i = 1; i < strs.length; i++) {
    String str = strs[i];
    if (str == "") {
      return "";
    }
    int j = 0;
    int total = min(ans.length, str.length);
    String temp = "";
    while (j < total) {
      if (ans[j] == str[j]) {
        temp = temp + ans[j];
      } else {
        break;
      }
      j++;
    }
    ans = temp;
    if (ans == "") {
      return ans;
    }
  }
  return ans;
}

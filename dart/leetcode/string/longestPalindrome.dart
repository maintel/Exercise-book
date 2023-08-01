/**
 * 给你一个字符串 s，找到 s 中最长的回文子串。

如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

 

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
示例 2：

输入：s = "cbbd"
输出："bb"
 

提示：

1 <= s.length <= 1000
s 仅由数字和英文字母组成

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/longest-palindromic-substring
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(longestPalindrome2("babadab"));
}

String longestPalindrome(String s) {
  List<int> ss = s.codeUnits;
  List<int> subStr = [];
  for (var i = 0; i < s.length; i++) {
    List<int> sub = [];
    int current = ss[i];
    sub.add(current);

    // 先向左查
    int l = i - 1;
    int r = i + 1;
    // 如果左等于当前，则找到一个substr ，然后继续向左查找直到左不等于当前
    // 如果左不等于当前，则查找右，如果最左等右，则找到一个substr，如果不等于则结束。
    // 继续查找左，并查找右，如果左右相等则继续向两边扩展直到到边界，一旦左右不相等则结束
    while (l >= 0 || r < s.length) {
      if (l >= 0 && ss[l] == current && r == i + 1) {
        l--;
        sub.add(current);
      } else if (l >= 0 && r < s.length && ss[l] == ss[r]) {
        sub.insert(0, ss[l]);
        sub.add(ss[r]);
        l--;
        r++;
      } else {
        break;
      }
    }
    if (subStr.length < sub.length) {
      subStr.clear();
      subStr.addAll(sub);
    }
  }
  return String.fromCharCodes(subStr);
}

// 对比之前的算法，可以只记录开始和结束的位置，最后截取字符串即可
String longestPalindrome2(String s) {
  if (s.length < 2) {
    return s;
  }
  List<int> ss = s.codeUnits;
  int minl = 0;
  int maxr = 0;
  for (var i = 0; i < s.length; i++) {
    int current = ss[i];

    // 先向左查
    int l = i - 1;
    int r = i + 1;
    int tl = i;
    int tr = i;
    // 如果左等于当前，则找到一个substr ，然后继续向左查找直到左不等于当前
    // 如果左不等于当前，则查找右，如果最左等右，则找到一个substr，如果不等于则结束。
    // 继续查找左，并查找右，如果左右相等则继续向两边扩展直到到边界，一旦左右不相等则结束
    while (l >= 0 || r < s.length) {
      if (l >= 0 && ss[l] == current && r == i + 1) {
        tl = l;
        l--;
      } else if (l >= 0 && r < s.length && ss[l] == ss[r]) {
        tr = r;
        tl = l;
        l--;
        r++;
      } else {
        break;
      }
    }
    if (tr - tl > maxr - minl) {
      minl = tl;
      maxr = tr;
    }
  }
  return s.substring(minl, maxr + 1);
}

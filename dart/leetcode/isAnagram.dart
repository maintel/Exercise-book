/**
 * 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

 

示例 1:

输入: s = "anagram", t = "nagaram"
输出: true
示例 2:

输入: s = "rat", t = "car"
输出: false
 

提示:

1 <= s.length, t.length <= 5 * 104
s 和 t 仅包含小写字母
 

进阶: 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/valid-anagram
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(isAnagram2("anagramb", "nagarama"));
}

bool isAnagram(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  List<int> sChars = s.codeUnits;
  List<int> tChars = t.codeUnits;
  List<int> abc = List.filled(26, 0);
  for (var i = 0; i < s.length; i++) {
    abc[sChars[i] - 97] = abc[sChars[i] - 97] + 1;
    abc[tChars[i] - 97] = abc[tChars[i] - 97] - 1;
  }

  for (var element in abc) {
    if (element != 0) {
      return false;
    }
  }

  return true;
}

/**
 * 用一个长度为26的数组来存储字母对应的个数，逐字遍历 s 和 t，读s 时对应字母 + 1，t时对应字母 -1， 
 * 最后遍历这个数组看看是否有为不为0 的位如果有则返回 false，否则返回 true
 * 
 * 对于进阶问题说的是 unicode 字符，那么可以把存储字母的数组变成一个map，key为每种字符，value也分别 + - 1，
 */

bool isAnagram2(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  List<int> sChars = s.codeUnits;
  List<int> tChars = t.codeUnits;
  Map<int, int> abc = {};
  for (var i = 0; i < s.length; i++) {
    abc[sChars[i] - 97] = (abc[sChars[i] - 97] ?? 0) + 1;
    abc[tChars[i] - 97] = (abc[tChars[i] - 97] ?? 0) - 1;
  }

  for (var element in abc.values) {
    if (element != 0) {
      return false;
    }
  }

  return true;
}

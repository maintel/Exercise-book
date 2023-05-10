/**
 * 给定一个字符串 s 和一个字符串数组 words。 words 中所有字符串 长度相同。

 s 中的 串联子串 是指一个包含  words 中所有字符串以任意顺序排列连接起来的子串。

例如，如果 words = ["ab","cd","ef"]， 那么 "abcdef"， "abefcd"，"cdabef"， "cdefab"，"efabcd"， 和 "efcdab" 都是串联子串。 "acdbef" 不是串联子串
，因为他不是任何 words 排列的连接。
返回所有串联字串在 s 中的开始索引。你可以以 任意顺序 返回答案。

 

示例 1：

输入：s = "barfoothefoobarman", words = ["foo","bar"]
输出：[0,9]
解释：因为 words.length == 2 同时 words[i].length == 3，连接的子字符串的长度必须为 6。
子串 "barfoo" 开始位置是 0。它是 words 中以 ["bar","foo"] 顺序排列的连接。
子串 "foobar" 开始位置是 9。它是 words 中以 ["foo","bar"] 顺序排列的连接。
输出顺序无关紧要。返回 [9,0] 也是可以的。
示例 2：

输入：s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
输出：[]
解释：因为 words.length == 4 并且 words[i].length == 4，所以串联子串的长度必须为 16。
s 中没有子串长度为 16 并且等于 words 的任何顺序排列的连接。
所以我们返回一个空数组。
示例 3：

输入：s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
输出：[6,9,12]
解释：因为 words.length == 3 并且 words[i].length == 3，所以串联子串的长度必须为 9。
子串 "foobarthe" 开始位置是 6。它是 words 中以 ["foo","bar","the"] 顺序排列的连接。
子串 "barthefoo" 开始位置是 9。它是 words 中以 ["bar","the","foo"] 顺序排列的连接。
子串 "thefoobar" 开始位置是 12。它是 words 中以 ["the","foo","bar"] 顺序排列的连接。
 

提示：

1 <= s.length <= 104
1 <= words.length <= 5000
1 <= words[i].length <= 30
words[i] 和 s 由小写英文字母组成

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/substring-with-concatenation-of-all-words
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(findSubstring(
      "wordgoodgoodgoodbestword", ["word", "good", "best", "word"]));
  print(findSubstring("barfoothefoobarman", ["foo", "bar"]));
}

List<int> findSubstring(String s, List<String> words) {
  if (words.length > s.length) {
    return [];
  }
  int totalLength = words.length * words[0].length;
  if (totalLength > s.length) {
    return [];
  }
  int i = 0;
  int lenghtWord = words[0].length;
  List<int> ans = [];

  // 先查找到所有子串
  while (i <= s.length - totalLength) {
    String subs = s.substring(i, i + totalLength);
    int j = 0;
    // 再将子串按照 每个单词的长度分割，并统计次数
    Map<String, int> subsMap = {};
    while (j < subs.length) {
      String key = subs.substring(j, j + lenghtWord);
      int value = (subsMap[key] ?? 0);
      j = j + lenghtWord;
      subsMap[key] = value + 1;
    }
    bool jump = false;
    for (var j = 0; j < words.length; j++) {
      String word = words[j];
      int value = subsMap[word] ?? 0;
      if (value <= 0) {
        jump = true;
        continue;
      }
      subsMap[word] = value - 1;
    }
    if (!jump) {
      ans.add(i);
    }
    i++;
  }

  return ans;
}

// words.length == n 总排列组合一共有  ,n! => n * n-1 * n -2 ..... 1 种
// 有些条件要满足： words.length * word[i].lengh <= s.lengh;  words.length <= s.length
// 直接暴力排列肯定不行的，因为阶乘计算的增长太快了
// 所以是否可以用排除的方式来计算，因为是有规律的。
// 首先找到 s 所有长度为 words.length * word[i].lengh 的子串 subList ，并把这个子串按照 word[i].lengh 的长度分割并用一个 map 来统计
// 每个单词出现的次数，每次出现对应单词次数+1，
// 接着遍历 s的所有子串 subList ,然后依次查找 words 中的单词在 map 是否出现，每次出现对应单词次数 -1， 可以优化一下只要查找的单词不存在或者查找的单词次数已经
// 为 0，则可以跳出循环 因为这表示在这个子串中已经不可能满足了，否则在每趟 words 遍历完以后 ans.add[i] 这里 i 就是起始位置。


// 对上面再优化一下就是，边查找 s 的子串，边对比这个子串是否和 word 中的单词匹配。 可以减少一次对s子串的遍历遍历

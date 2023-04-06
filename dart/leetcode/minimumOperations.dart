import 'dart:ffi';
import 'dart:math';

/**
 * 小扣出去秋游，途中收集了一些红叶和黄叶，他利用这些叶子初步整理了一份秋叶收藏集 leaves， 字符串 leaves 仅包含小写字符 r 和 y， 其中字符 r 表示一片红叶，
 * 字符 y 表示一片黄叶。
出于美观整齐的考虑，小扣想要将收藏集中树叶的排列调整成「红、黄、红」三部分。每部分树叶数量可以不相等，但均需大于等于 1。每次调整操作，
小扣可以将一片红叶替换成黄叶或者将一片黄叶替换成红叶。请问小扣最少需要多少次调整操作才能将秋叶收藏集调整完毕。

示例 1：

输入：leaves = "rrryyyrryyyrr"

输出：2

解释：调整两次，将中间的两片红叶替换成黄叶，得到 "rrryyyyyyyyrr"

示例 2：

输入：leaves = "ryr"

输出：0

解释：已符合要求，不需要额外操作

提示：

3 <= leaves.length <= 10^5
leaves 中只包含字符 'r' 和字符 'y'

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/UlBDOe
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(minimumOperations("ryr"));
}

int minimumOperations(String leaves) {
  List<List<int>> f = List.filled(leaves.length, []);
  List<int> sChars = leaves.codeUnits;
  f[0] = List.filled(3, 0);
  f[1] = List.filled(3, 0);
  f[0][0] = sChars[0] == 114 ? 0 : 1;
  f[0][1] = f[0][2] = f[1][2] = leaves.length;

  for (var i = 1; i < sChars.length; i++) {
    int isRed = sChars[i] == 114 ? 1 : 0;
    int isY = sChars[i] == 114 ? 0 : 1;
    if (i >= 2) f[i] = List.filled(3, 0);
    f[i][0] = f[i - 1][0] + isY; // 变成红色操作数 上一个步操作 + 本次操作数
    f[i][1] =
        min(f[i - 1][0], f[i - 1][1]) + isRed; // 变成黄色 上一步变黄或变红的操作取小的加上本次操作数
    if (i >= 2) {
      // 从第三个开始要记录下
      f[i][2] = min(f[i - 1][1], f[i - 1][2]) + isY;
    }
  }
  return f[leaves.length - 1][2];
}

/**
 * 要找到第一个出现y和最后出现y的地方，然后找到其中的r的数量，两种边界情况，中间全是y，或者中间全是r
 * 上面思路不太对
 * 应该是先找到一个分界点，表示了从这个分界点N 到 index = 1,和 到 length -1 两段中y和r数量多的和少的，
 * 比如说前半部分y多，后半部分r多，则前半部分r替换成y，后半部分y替换成r
 * 还是不对，应该还是动态规划的问题，
 * 
 * 看了官方题解
 * 
 */
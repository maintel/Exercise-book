/**
 * 6. N 字形变换
 * 将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

P   A   H   N
A P L S I I G
Y   I   R
之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

请你实现这个将字符串进行指定行数变换的函数：

string convert(string s, int numRows);
 

示例 1：

输入：s = "PAYPALISHIRING", numRows = 3
输出："PAHNAPLSIIGYIR"
示例 2：
输入：s = "PAYPALISHIRING", numRows = 4
输出："PINALSIGYAHRPI"
解释：
P     I    N
A   L S  I G
Y A   H R
P     I
示例 3：

输入：s = "A", numRows = 1
输出："A"
 

提示：

1 <= s.length <= 1000
s 由英文字母（小写和大写）、',' 和 '.' 组成
1 <= numRows <= 1000
 */

void main(List<String> args) {
  print(convert("ab", 1));
}

String convert(String s, int numRows) {
  if (numRows == 1) {
    return s;
  }
  // 这里假设了一个矩阵 有一个规律就是 x * 2 + y 就是 s中对应的下标
  // 然后按照顺序将s放入矩阵中，然后统计矩阵的每一行最后相加就得出结果
  int x = 0;
  int y = 0;
  List<List<int>> dp = [];
  List<int> ss = s.codeUnits;
  while (x * 2 + y < s.length) {
    print("x:$x  y:$y ${String.fromCharCode(ss[x * 2 + y])}");
    if (dp.length <= y) {
      dp.add([]);
    }
    dp[y].add(ss[x * 2 + y]);
    if (y + 1 >= numRows) {
      x++;
      y--;
    } else if (x % (numRows - 1) != 0) {
      y--;
      x++;
    } else {
      y++;
    }
  }

  String s1 = "";
  dp.forEach((element) {
    s1 = s1 + String.fromCharCodes(element);
  });

  return s1;
}

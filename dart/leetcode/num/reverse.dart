/**
 * 7. 整数反转
中等
给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

假设环境不允许存储 64 位整数（有符号或无符号）。
 

示例 1：

输入：x = 123
输出：321
示例 2：

输入：x = -123
输出：-321
示例 3：

输入：x = 120
输出：21
示例 4：

输入：x = 0
输出：0
 

提示：

-2^31 <= x <= 2^31 - 1
 */

void main(List<String> args) {
  print(reverse2(120));
}

int reverse(int x) {
  if (x > 0) {
    int n = int.parse(String.fromCharCodes(x.toString().codeUnits.reversed));
    if (n > 2147483647) {
      return 0;
    } else {
      return n;
    }
  } else {
    int n = 0 -
        int.parse(String.fromCharCodes(x.abs().toString().codeUnits.reversed));
    if (n < -2147483648) {
      return 0;
    } else {
      return n;
    }
  }
}

// 用取模的办法
int reverse2(int x) {
  int ans = 0;
  int nx = x.abs();
  int key = 2147483647 + (x < 0 ? 1 : 0);
  while (nx != 0) {
    int m = nx % 10;
    nx = nx ~/ 10;
    ans = ans * 10 + m;
    if (ans > key) {
      return 0;
    }
  }
  if (x < 0) {
    return 0 - ans;
  }
  return ans;
}

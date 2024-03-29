import 'dart:ffi';

/**
 * 给定正整数 k ，你需要找出可以被 k 整除的、仅包含数字 1 的最 小 正整数 n 的长度。

返回 n 的长度。如果不存在这样的 n ，就返回-1。

注意： n 不符合 64 位带符号整数。

 

示例 1：

输入：k = 1
输出：1
解释：最小的答案是 n = 1，其长度为 1。
示例 2：

输入：k = 2
输出：-1
解释：不存在可被 2 整除的正整数 n 。
示例 3：

输入：k = 3
输出：3
解释：最小的答案是 n = 111，其长度为 3。
 

提示：

1 <= k <= 105


来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/smallest-integer-divisible-by-k
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(1111111111111111.0 * 10);
  print(1111111111111111111.0 % 23);
  print(smallestRepunitDivByK(31));
}

int smallestRepunitDivByK(int k) {
  if (k % 2 == 0 || k % 5 == 0) {
    return -1;
  }
  int j = 1;
  double r = 1.0 % k;
  while (r != 0) {
    r = (r * 10 + 1) % k;
    print(r);
    j++;
  }

  return j;
}

// 首先可以知道 如果k的个位数是 1，3，7 ,9 的时候才可能被整除，否则一定不可能被整除
// 有一个办法就是暴力计算，排除掉 能整除 2 和 5 的以后。
// 设起始值为n = 1，然后每次 计算 n 是否能整除 k，如果不能则 n = n * 10 +1,直至能整除为止，同时记录下长度，每次循环长度+1.

// 还有一种更优化的算法，同样先排除 2 和 5，
// 同时 在整体取余之前，先局部取余，不会影响最终结果，因为任何数整除自身结果都是1，
// 例如：(a +b)%c = ((a+b)%c)%c = (a%c + b%c)%c, 很好理解因为 c%c = c；所以 (a +b)%c = ((a+b)%c)%c
// 然后我们记 n0 =1, r0 = n0 % k，如果r ！= 0 ，
// 则 n1 = n0*10 +1  r1 = n1 % k ,如果 r1 != 0
// 则 n2 = n1*10 +1  r2 = n2 % k = (n1 * 10 + 1) % k 
//                              = （（n1 * 10）% k + 1 %k ）% k  // 这一步的思想就是先局部取余，然后再对局部余数的和再取余，结果和整体取余是一样的
//                              = ((n1 %k * 10 %k) %k + 1 %k) %k
//                              = ((r1 % k * 10%k) % k + 1 %k) %k 
//                              = ((r1 * 10) %k + 1 % k) %k
//                              = ((r1 * 10) + 1) % k
// 因此我们可以得出，n每进一位它 %k 的余数都可以根据上一个 余数计算得出，因此不必要计算 n 的值，只计算 n 的位数即可；
// 因此就有了 r = 1.0 % k; 同时循环判断 r != 0 则 r = (r * 10 +1) %k, 这样做的好处是我们不必考虑 n 的位数溢出的问题
// 同时需要确定一件事 如果一个数不能被2 和 5 整除，那它一定能被 1，3，7 整除么？
// 首先可以知道 n % k 的余数一定是 0 和 k-1 之间，则余数一定会循环 因为 n 是无穷大
// 那我们可以假设 a % k = b % k，则 ( a - b ) % k = 0; 
// 因为 a 和 b 都由 1 组成，则 a - b => 111....0000  => k * m
// 因为我们已经排除掉了 5 ，所以 k * m 结果的中的 低位 000 一定来自于 k*j * 10的倍数 ==> k * j * 10^i
// 所以有 a-b => 1111...000 ==> k * j * 10^i，假设我们去掉 10^i, 假设我们去掉了 a- b 结果中的所有 0，
// 则 我们可以得出 k * j 的结果为 1111...111因此可以推断出 一定是有解的。
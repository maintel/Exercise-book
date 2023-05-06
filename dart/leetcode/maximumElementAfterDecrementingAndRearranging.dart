import 'dart:math';

/**
 * 给你一个正整数数组 arr 。请你对 arr 执行一些操作（也可以不进行任何操作），使得数组满足以下条件：

arr 中 第一个 元素必须为 1 。
任意相邻两个元素的差的绝对值 小于等于 1 ，也就是说，对于任意的 1 <= i < arr.length （数组下标从 0 开始），都满足 abs(arr[i] - arr[i - 1]) <= 1 。abs(x) 为 x 的绝对值。
你可以执行以下 2 种操作任意次：

减小 arr 中任意元素的值，使其变为一个 更小的正整数 。
重新排列 arr 中的元素，你可以以任意顺序重新排列。
请你返回执行以上操作后，在满足前文所述的条件下，arr 中可能的 最大值 。

 

示例 1：

输入：arr = [2,2,1,2,1]
输出：2
解释：
我们可以重新排列 arr 得到 [1,2,2,2,1] ，该数组满足所有条件。
arr 中最大元素为 2 。
示例 2：

输入：arr = [100,1,1000]
输出：3
解释：
一个可行的方案如下：
1. 重新排列 arr 得到 [1,100,1000] 。
2. 将第二个元素减小为 2 。
3. 将第三个元素减小为 3 。
现在 arr = [1,2,3] ，满足所有条件。
arr 中最大元素为 3 。
示例 3：

输入：arr = [1,2,3,4,5]
输出：5
解释：数组已经满足所有条件，最大元素为 5 。
 

提示：

1 <= arr.length <= 105
1 <= arr[i] <= 109

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/maximum-element-after-decreasing-and-rearranging
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(maximumElementAfterDecrementingAndRearranging2([2, 222, 1, 2, 4]));
}

int maximumElementAfterDecrementingAndRearranging(List<int> arr) {
  if (arr.length == 1) {
    return arr[0] == 1 ? arr[0] : 1;
  }
  int ans = 0;
  arr.sort();
  arr[0] = 1;
  for (var i = 1; i < arr.length; i++) {
    if (arr[i] - arr[i - 1] > 1) {
      arr[i] = arr[i - 1] + 1;
    }
  }
  ans = arr.last;
  return ans;
}

// 思路 先对 arr 进行排序 然后遍历 arr， 如果 arr[i] -arr[i-1] > 1 则 arr[i] = arr[i-1] + 1 ，最终 arr.last 就是要找的值
// 算法复杂度为 排序算法的复杂度 + n

// 更好的算法，根据题目可以知道答案有一个条件，就是最终答案 ans 必定小于等于 arr 的长度 n 。
// 先遍历 arr 记录下所有元素出现的次数，
// 计数排序之后从小到大的遍历，比如 n 的个数是 0 ，意味着可以通过把比 n 大的某个数字变成 n 来填充这个空缺，空缺的数量就记为 miss 变量，
//之后遍历到大于 n 的数的时候，如果该数计数的数量大于 1 ，意味着除了填补自身的空白，该数可以用于填充前面缺失的数，也就是说 miss 变量减少，
//但是注意一下 miss 变量是不能小于 0 的。 最后用数组长度减去 miss（空缺的数量) 就得到了结果， 记数组长度为 Len, 
//可以理解为把所有已经填充的数字(Len - miss 个)变成从 1, 2, 3... Len - miss，这样最大的数就是 Len - miss。

int maximumElementAfterDecrementingAndRearranging2(List<int> arr) {
  int n = arr.length;
  List<int> temp = List.filled(n + 1, 0);
  for (var element in arr) {
    temp[min(n, element)]++; //存储下小于n的元素的个数 temp[i] 即为这个元素在 arr 中出现的次数，
  }

  int miss = 0;
  for (int i = 1; i <= n; ++i) {
    if (temp[i] == 0) {
      ++miss;
    } else {
      miss -= min(temp[i] - 1, miss); 
    }
  }
  return n - miss;
}

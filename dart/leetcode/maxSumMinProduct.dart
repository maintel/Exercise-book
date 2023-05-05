void main(List<String> args) {
  print(maxSumMinProduct([3, 1, 5, 6, 4, 2, 100]));
  print( (9990101*9990101) % 1000000007);
}

/**
 * 一个数组的 最小乘积 定义为这个数组中 最小值 乘以 数组的 和 。

比方说，数组 [3,2,5] （最小值是 2）的最小乘积为 2 * (3+2+5) = 2 * 10 = 20 。
给你一个正整数数组 nums ，请你返回 nums 任意 非空子数组 的最小乘积 的 最大值 。由于答案可能很大，请你返回答案对  109 + 7 取余 的结果。

请注意，最小乘积的最大值考虑的是取余操作 之前 的结果。题目保证最小乘积的最大值在 不取余 的情况下可以用 64 位有符号整数 保存。

子数组 定义为一个数组的 连续 部分。
示例 1：

输入：nums = [1,2,3,2]
输出：14
解释：最小乘积的最大值由子数组 [2,3,2] （最小值是 2）得到。
2 * (2+3+2) = 2 * 7 = 14 。
示例 2：

输入：nums = [2,3,3,1,2]
输出：18
解释：最小乘积的最大值由子数组 [3,3] （最小值是 3）得到。
3 * (3+3) = 3 * 6 = 18 。 

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/maximum-subarray-min-product
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

int maxSumMinProduct(List<int> nums) {
  int max = 0;

  for (var i = 0; i < nums.length; i++) {
    int total = 0;
    int min = nums[i];
    for (var j = i; j < nums.length; j++) {
      total = total + nums[j];

      if (nums[j] < min) {
        min = nums[j];
      }
      print(total);
      print("min:$min");
      int temp = total * min;
      if (temp > max) {
        max = temp;
      }
    }
  }
  return max;
}



// 思路 先排序，然后从后往前逐个累加计算
// 不对， 上面有一个定义为 子数组定义为一个数组的连续部分，如果排序了，那么子数组就不是连续的了
// 暴力求解也是可行的，算法复杂度是 O(n2)  算法复杂度太高了
// 
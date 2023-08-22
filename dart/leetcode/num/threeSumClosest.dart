/**
 * 16. 最接近的三数之和
中等
1.5K
相关企业
给你一个长度为 n 的整数数组 nums 和 一个目标值 target。请你从 nums 中选出三个整数，使它们的和与 target 最接近。

返回这三个数的和。

假定每组输入只存在恰好一个解。

 

示例 1：

输入：nums = [-1,2,1,-4], target = 1
输出：2
解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
示例 2：

输入：nums = [0,0,0], target = 1
输出：0
 

提示：

3 <= nums.length <= 1000
-1000 <= nums[i] <= 1000
-104 <= target <= 104
https://leetcode.cn/problems/3sum-closest/
 */

void main(List<String> args) {
  print(threeSumClosest([
    -23,
    -67,
    32,
    21,
    -65,
    46,
    73,
    42,
    93,
    9,
    -61,
    -79,
    -51,
    61,
    -15,
    49,
    92,
    -34,
    50,
    1,
    26,
    -12,
    68,
    -97,
    -17,
    51,
    -55,
    75,
    -56,
    -95,
    -70,
    -42,
    91,
    -18,
    -64,
    20,
    33,
    -20,
    19,
    61,
    -89,
    81,
    -73,
    82,
    -23,
    -65,
    51,
    -88,
    15,
    -48,
    24,
    34,
    0,
    -24,
    37,
    22,
    28,
    -67,
    -25,
    -61,
    -57,
    -74,
    65,
    50,
    -66,
    24,
    99,
    80,
    44,
    85,
    20,
    -4,
    -9,
    -81,
    87,
    -82,
    -100,
    51,
    -83,
    9,
    -31,
    37,
    23,
    -61,
    53,
    -14,
    -51,
    88,
    56,
    27,
    42,
    -52,
    -97,
    37,
    36,
    -59,
    -45,
    95,
    46,
    -1,
    -100,
    -38,
    66,
    44,
    27,
    -97,
    12,
    -43,
    84,
    -53,
    93,
    18,
    -40,
    -38,
    34,
    85,
    53,
    -50,
    -14,
    -6,
    98,
    -77,
    -17,
    50,
    -65,
    52,
    -46,
    -94,
    49,
    72,
    -2,
    -82,
    45,
    -39,
    -58,
    67,
    82,
    63,
    95,
    -32,
    47,
    15,
    -20,
    46,
    5,
    17,
    -40,
    -95,
    97,
    -9,
    11,
    8,
    -51,
    -24,
    -50,
    -37,
    -72,
    -57,
    26,
    26,
    19,
    71,
    -42
  ], -87));
}

/**
 * -5
-4
0
-1
-2
-2
 */
int threeSumClosest(List<int> nums, int target) {
  int ans = double.maxFinite.toInt();
  nums.sort();
  for (var i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    int j = i + 1;
    int k = nums.length - 1;
    int ni = nums[i];
    while (j < k) {
      int temp = ni + nums[j] + nums[k];
      if (temp == target) {
        return temp;
      }

      if ((target - temp).abs() < (target - ans).abs()) {
        ans = temp;
      }
      if (temp <= target) {
        j++;
      } else {
        k--;
      }
    }
  }
  return ans;
}

import 'dart:math';

/**
 *  盛最多水的容器
给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

返回容器可以储存的最大水量。

说明：你不能倾斜容器。

 

示例 1：



输入：[1,8,6,2,5,4,8,3,7]
输出：49 
解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
示例 2：

输入：height = [1,1]
输出：1
 

提示：

n == height.length
2 <= n <= 105
0 <= height[i] <= 104
https://leetcode.cn/problems/container-with-most-water/
 */
void main(List<String> args) {}

int maxArea(List<int> height) {
  // 就是求面积 如果暴力求解，则算法复杂度为 O(n^2)
  // 这个思路就是遍历 list 然后每读到一个值就向前回溯找到面积最大的，直至遍历完整个数组
  // 也就是每次都求出 i 左侧最大的
  return 0;
}

int maxAreaPro(List<int> height) {
  // 可以同时从头尾遍历，然后计算i和j之间的值，直至 i ==j ,就得出最大值
  int i = 0;
  int j = height.length - 1;
  int ans = 0;
  while (j > i) {
    ans = max(ans, (j - 1) * min(height[i], height[j]));
    if (height[i] <= height[j]) {
      i++;
    } else {
      j--;
    }
  }
  return ans;
}

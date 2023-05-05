/**
 * 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

求在该柱状图中，能够勾勒出来的矩形的最大面积。

输入：heights = [2,1,5,6,2,3]
输出：10
解释：最大的矩形为5,6区域，面积为 10
输入： heights = [2,4]
输出： 4

https://leetcode.cn/problems/largest-rectangle-in-histogram/
 */
import 'dart:math';

void main(List<String> args) {
  print(largestRectangleArea3([2, 1, 5, 6, 2, 3]));
}

int largestRectangleArea(List<int> heights) {
  int max = 0;

  List<int> stack = [];
  Map<int, int> rightMap = {};
  Map<int, int> leftMap = {};
  List<int> stackL = [];
  for (var i = heights.length - 1; i >= 0; i--) {
    int element = heights[i];
    int j = stack.length - 1;
    while (stack.length > 0 && j >= 0) {
      if (heights[stack[j]] < element) {
        break;
      }
      j--;
    }
    rightMap[i] = j == stack.length - 1 ? -1 : stack[j + 1];
    // 如果当前栈为空， 或者 当前的元素大于等于栈顶的元素，则添加进去
    stack.add(i);
    int left = heights.length - 1 - i;
    int elementL = heights[left];
    j = stackL.length - 1;
    while (stackL.length > 0 && j >= 0) {
      if (heights[stackL[j]] < elementL) {
        break;
      }
      j--;
    }
    leftMap[left] = j == stackL.length - 1 ? -1 : stackL[j + 1];
    stackL.add(left);
  }

  for (var i = 0; i < heights.length; i++) {
    int left = (leftMap[i] ?? -1);
    int right = rightMap[i] ?? -1;
    int width = (right == -1 ? i : right) - (left == -1 ? i : left) + 1;
    int temp = heights[i] * width;
    if (max < temp) {
      max = temp;
    }
  }

  return max;
}

///便利数组， 分别找到每个元素的左右 最后一个比他大的值，然后计算 总长度*当前的高度即为最大面积
///但是怎么找是个问题， 如果每个都比较则复杂度为 O(n^2)
///因此还是要考虑到之前的单调栈找下一个最大元素的那一题[nextGreaterElement2]
///需要找到 heights 中每一个元素 h 的右边连续的最后一个大于等于h的下标right，和左边连续的最后一个大于等于h的下标left，则这个面积就是以它自身为高。宽度为right-left + 1
///需要在尽可能少遍历的情况下记录下每个heights对应的值
///
///找到最有一个大于等于h的值，则可以转变为找到第一个小于h的值，对于左侧如果找到末尾还没有则默认值为-1（认为是下标0之前的值），对于右侧来说则应为 heights.lengh （认为是最后一个元素后面的元素）
///
///
int largestRectangleArea2(List<int> heights) {
  int ans = 0;

  List<int> stack = [];
  List<int> rightMap = List.filled(heights.length, heights.length);
  List<int> leftMap = List.filled(heights.length, -1);
  List<int> stackL = [];

  for (var i = heights.length - 1; i >= 0; i--) {
    int element = heights[i];
    while (stack.length > 0 && heights[stack.last] >= element) {
      stack.removeLast();
    }
    rightMap[i] = stack.length > 0 ? stack.last : heights.length;
    stack.add(i);

    int left = heights.length - 1 - i;
    int elementL = heights[left];
    while (stackL.length > 0 && heights[stackL.last] >= elementL) {
      stackL.removeLast();
    }
    leftMap[left] = stackL.length > 0 ? stackL.last : -1;
    stackL.add(left);
  }

  for (var i = 0; i < heights.length; i++) {
    ans = max(ans, heights[i] * (rightMap[i]! - leftMap[i]! - 1));
  }
  return ans;
}

/// 有没有办法用一个栈来处理，同时减少遍历的次数，方法2 的遍历次数理论上来说是 3n
///
int largestRectangleArea3(List<int> heights) {
  int ans = 0;

  List<int> stack = [];

  for (var i = 0; i < heights.length; i++) {
    // ans = max(ans, heights[i] * (rightMap[i]! - leftMap[i]! - 1));
    if (stack.length > 0 && heights[i] <= stack.last) {
      stack.removeLast();
    }else {
      
    }
  }
  return ans;
}

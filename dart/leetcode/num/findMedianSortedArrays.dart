import 'dart:math';

/**
 * 4. 寻找两个正序数组的中位数
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。

 

示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2
示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 

 

提示：

nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106
 */

void main(List<String> args) {
  print(findMedianSortedArrays([1], [3, 4]));
}

// 这个算法的复杂度为 (m+n)/2 即为 O(m+n)
double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  int maxL = nums1.length + nums2.length;
  bool jo = maxL % 2 == 0;
  int z = 0;
  if (jo) {
    z = maxL ~/ 2 - 1;
  } else {
    z = (maxL - 1) ~/ 2;
  }
  int n1 = 0;
  int n2 = 0;
  List<int> s = [];
  while (n1 < nums1.length || n2 < nums2.length) {
    if (n2 >= nums2.length) {
      s.add(nums1[n1]);
      n1++;
    } else if (n1 >= nums1.length) {
      s.add(nums2[n2]);
      n2++;
    } else if (nums1[n1] <= nums2[n2]) {
      s.add(nums1[n1]);
      n1++;
    } else {
      s.add(nums2[n2]);
      n2++;
    }
    if (s.length == z + 1 && !jo) {
      return s.last.toDouble();
    } else if (s.length == z + 2 && jo) {
      return (s.last + s[s.length - 2]) / 2;
    }
  }

  return 0;
}

/**
 * nums1 中数字 x 的 下一个更大元素 是指 x 在 nums2 中对应位置 右侧 的 第一个 比 x 大的元素。

给你两个 没有重复元素 的数组 nums1 和 nums2 ，下标从 0 开始计数，其中nums1 是 nums2 的子集。

对于每个 0 <= i < nums1.length ，找出满足 nums1[i] == nums2[j] 的下标 j ，并且在 nums2 确定 nums2[j] 的 下一个更大元素 。如果不存在下一个更大元素，那么本次查询的答案是 -1 。

返回一个长度为 nums1.length 的数组 ans 作为答案，满足 ans[i] 是如上所述的 下一个更大元素 。

 

示例 1：

输入：nums1 = [4,1,2], nums2 = [1,3,4,2].
输出：[-1,3,-1]
解释：nums1 中每个值的下一个更大元素如下所述：
- 4 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
- 1 ，用加粗斜体标识，nums2 = [1,3,4,2]。下一个更大元素是 3 。
- 2 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
示例 2：

输入：nums1 = [2,4], nums2 = [1,2,3,4].
输出：[3,-1]
解释：nums1 中每个值的下一个更大元素如下所述：
- 2 ，用加粗斜体标识，nums2 = [1,2,3,4]。下一个更大元素是 3 。
- 4 ，用加粗斜体标识，nums2 = [1,2,3,4]。不存在下一个更大元素，所以答案是 -1 。
 

提示：

1 <= nums1.length <= nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 104
nums1和nums2中所有整数 互不相同
nums1 中的所有整数同样出现在 nums2 中
 

进阶：你可以设计一个时间复杂度为 O(nums1.length + nums2.length) 的解决方案吗？

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/next-greater-element-i
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(nextGreaterElement2([4, 1, 3], [2, 5, 3, 6, 8, 4, 7, 1]));
}

List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
  List<int> ans = List.filled(nums1.length, -1);
  for (var i = 0; i < nums1.length; i++) {
    for (var j = 0; j < nums2.length; j++) {
      if (nums1[i] == nums2[j]) {
        for (var k = j; k < nums2.length; k++) {
          if (nums2[k] > nums1[i]) {
            ans[i] = nums2[k];
            break;
          }
        }
        break;
      }
    }
  }

  return ans;
}

// 两次遍历，算法复杂度为 O(mn), 此种算法复杂度太高了

List<int> nextGreaterElement2(List<int> nums1, List<int> nums2) {
  List<int> ans = List.filled(nums1.length, -1);
  List<int> stack = [];
  Map<int, int> nums2Map = {};
  for (var i = nums2.length - 1; i >= 0; i--) {
    int element = nums2[i];
    print(element);
    while (stack.length > 0 && stack.last < element) {
      stack.removeLast();
    }
    nums2Map[element] = stack.length == 0 ? -1 : stack.last;

    stack.add(element);
  }
  for (var i = 0; i < nums1.length; i++) {
    ans[i] = nums2Map[nums1[i]] ?? -1;
  }

  return ans;
}
// 单调栈解法， 既然要计算某个元素右边的最大元素，那么只要想办法记录下 nums2 中每个元素右边最大的元素即可。
// 因此可以通过倒叙遍历 nums2， 并把每个元素和它对应的右侧最大元素记录在一个map中，这样遍历nums1 查询的时候直接查这个map表即可得到想要的结果
// 此时需要考虑的就是如何通过一次遍历就得到 nums2 中每个元素右侧的最大值。可以使用一个栈来计算，这个栈用来存放当前元素右边所有比当前元素大的元素，
// 依次倒叙遍历 nums2 就能保证栈顶的元素肯定是当前元素的下一个最大元素
//比如：2，5，3，6，8，4，7，1
// 倒叙遍历 读到1，此时 stack为空，则 map[1] = -1，然后把 1 压栈（因为1是最有一个元素它右边不存在元素，所以为-1）
//         读到7， stack =[1], 7 > 1, 则 1出栈，此时 map[7] = -1, 因为 stack在1出栈后为空，
//         读 4   stack=[7], 4<7, 则7不出栈，此时 map[4] = 7, stack 不为空 取栈顶的元素，4入栈
//           8    stack=[4，7],8 >4,出栈 stack=[7],8>7, 7 出栈，此时 map[8] = -1，stack为空，8右边不存在比它更大的元素，8 入栈
//          6     stack=[8],  6<8,   map[6] = 8,  6->stack
//          3     stack=[6,8] ,3<6  map[3] = 6,   3->stack
//          5     stack=[3,6,8], 5>3, 3出栈，stack=[6,8],  5<6  map[5] = 6,    5->stack
//          2     stack=[5,6,8] 2<5,  map[2] = 5  2->stack



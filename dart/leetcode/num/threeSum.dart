/**
 * 三数之和
给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

你返回所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

 

 

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
解释：
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
注意，输出的顺序和三元组的顺序并不重要。
示例 2：

输入：nums = [0,1,1]
输出：[]
解释：唯一可能的三元组和不为 0 。
示例 3：

输入：nums = [0,0,0]
输出：[[0,0,0]]
解释：唯一可能的三元组和为 0 。
 

提示：

3 <= nums.length <= 3000
-105 <= nums[i] <= 105
 */

void main(List<String> args) {
  print(threeSumPro([-4, -2, -2, -2, 0, 1, 2, 2, 2, 3, 3, 4, 4, 6, 6]));
}

// 暴力法，算法复杂度 n^3
List<List<int>> threeSum(List<int> nums) {
  Map<String, List<int>> ans = {};
  for (var i = 0; i < nums.length; i++) {
    for (var j = i + 1; j < nums.length; j++) {
      for (var k = j + 1; k < nums.length; k++) {
        if (nums[i] + nums[j] + nums[k] == 0) {
          List<int> value = [nums[i], nums[j], nums[k]];
          value.sort();
          if (ans[value.toString()] == null) {
            print("${nums[i]},${nums[j]},${nums[k]}");
            ans[value.toString()] = value;
          }
        }
      }
    }
  }
  return ans.values.toList();
}

// 取出来三个数，且三数之和为0，下标不能重复

List<List<int>> threeSumPro(List<int> nums) {
  // 上面的算法中 map 用来去重会浪费大量时间，
  // 而我们的答案中也不用给出下标，所以可以先对数组进行排序, 这样存到 ans 中的答案会自动去重
  // 此时的算法复杂度还是 n^3
  // 问题出在第二和三重循环，想象一下计算三数之和为0， 假设 a固定的话，b增大，则c一定减小
  // 因此我们可以在第二和三重循环优化，第二重循环从左向右，同时第三重循环从右向左，则二三中循环可以合并成一个
  nums.sort();
  List<List<int>> ans = [];
  String lastAns = "";
  for (var i = 0; i < nums.length - 2; i++) {
    if (i != 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    int j = i + 1;
    int k = nums.length - 1;
    while (k > j) {
      int value = nums[i] + nums[j] + nums[k];
      if (value == 0) {
        // String temp = "${nums[i]}, ${nums[j]}, ${nums[k]}";
        // if (temp != lastAns) {
        //   lastAns = temp;
        List<int> value = [nums[i], nums[j], nums[k]];
        // }
        ans.add(value);
      }
      if (value > 0) {
        k--;
        while (nums[k] == nums[k + 1] && k > 0) {
          k--;
        }
      } else {
        j++;
        while (nums[j] == nums[j - 1] && j < nums.length -1) {
          j++;
        }
      }
    }
  }
  return ans;
}

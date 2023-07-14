/**
 * 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

你可以按任意顺序返回答案。

 

示例 1：

输入：nums = [2,7,11,15], target = 9
输出：[0,1]
解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
示例 2：

输入：nums = [3,2,4], target = 6
输出：[1,2]
示例 3：

输入：nums = [3,3], target = 6
输出：[0,1]
 

提示：

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
只会存在一个有效答案
 

进阶：你可以想出一个时间复杂度小于 O(n2) 的算法吗？

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/two-sum
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(twoSumPro([2,2, 7, 11, 15], 4));
}

List<int> twoSum(List<int> nums, int target) {
  for (var i = 0; i < nums.length - 1; i++) {
    for (var j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
  return [];
}


// 算法复杂度为 O(N) 空间换时间的玩法，
//在 map 中存入 tag - nums[i] 为key， 下标 i 为值，因为一定有解，则 这个key 一定是 nums 中的某个没有遍历到的元素，
// 遍历 nums， 如果 map[nums[j]] 为空则说明还没有找到当前 nums[j] 对应的另外一个差值（tag - nums[j]），那么把当前差值和下标存入 map[tag-nums[j]] = j，
// 如果 map[nums[i]]不为空则说明上面的差值 tag - nums[j] = nums[i] 即 当前
// nums[j] + nums[i] => nums[map[tag-nums[j]]] + nums[i] => nums[map[nums[i]]] + nums[i] = tag,  则解为 [i,map[nums[i]]]
List<int> twoSumPro(List<int> nums, int target) {
  Map<int, int> map = {};
  for (var i = 0; i < nums.length; i++) {
    int n = nums[i];
    int y = target - n;
    if (map[n] != null) {
      return [i, map[n]!];
    }
    map[y] = i;
  }
  return [];
}

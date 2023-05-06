
/**
 * 存在一个由 n 个不同元素组成的整数数组 nums ，但你已经记不清具体内容。好在你还记得 nums 中的每一对相邻元素。

给你一个二维整数数组 adjacentPairs ，大小为 n - 1 ，其中每个 adjacentPairs[i] = [ui, vi] 表示元素 ui 和 vi 在 nums 中相邻。

题目数据保证所有由元素 nums[i] 和 nums[i+1] 组成的相邻元素对都存在于 adjacentPairs 中，存在形式可能是 [nums[i], nums[i+1]] ，也可能是 [nums[i+1], nums[i]] 。这些相邻元素对可以 按任意顺序 出现。

返回 原始数组 nums 。如果存在多种解答，返回 其中任意一个 即可。

 

示例 1：

输入：adjacentPairs = [[2,1],[3,4],[3,2]]
输出：[1,2,3,4]
解释：数组的所有相邻元素对都在 adjacentPairs 中。
特别要注意的是，adjacentPairs[i] 只表示两个元素相邻，并不保证其 左-右 顺序。
示例 2：

输入：adjacentPairs = [[4,-2],[1,4],[-3,1]]
输出：[-2,4,1,-3]
解释：数组中可能存在负数。
另一种解答是 [-3,1,4,-2] ，也会被视作正确答案。
示例 3：

输入：adjacentPairs = [[100000,-100000]]
输出：[100000,-100000]
 

提示：

nums.length == n
adjacentPairs.length == n - 1
adjacentPairs[i].length == 2
2 <= n <= 105
-105 <= nums[i], ui, vi <= 105
题目数据保证存在一些以 adjacentPairs 作为元素对的数组 nums

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/restore-the-array-from-adjacent-pairs
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  
  print(restoreArray([
    [2, 1],

  ]));
}

List<int> restoreArray(List<List<int>> adjacentPairs) {
  Map<int, List<int>> map = {};
  for (var element in adjacentPairs) {
    if (map[element[0]] == null) {
      map.putIfAbsent(element[0], () => [element[1]]);
    } else {
      map[element[0]]?.add(element[1]);
    }

    if (map[element[1]] == null) {
      map.putIfAbsent(element[1], () => [element[0]]);
    } else {
      map[element[1]]?.add(element[0]);
    }
  }

  var startAndEnd = map.entries.where((element) {
    return element.value.length == 1;
  });
  int start = startAndEnd.first.key;
  List<int> ans = [];
  ans.add(start);
  int key = map[start]![0];
  ans.add(key);
  int lastKey = start;

  while (map[key] != null) {
    var values = map[key]!;
    if (values.length == 1) {
      break;
    } else {
      for (var element in values) {
        if (element != lastKey) {
          ans.add(element);
        }
      }
    }
    key = ans.last;
    lastKey = ans[ans.length - 2];
  }
  return ans;
}
// 首先肯定剔除 adjacentPairs length 为1的情况。
// 注意一个特殊之处 “存在一个由 n 个不同元素组成的整数数组 nums”，所以可以想办法把adjacentPairs中的所有重复元素都剔除掉，都剔除掉以后剩下的就是 nums 中的元素，然后就是顺序问题。
// adjacentPairs 中的所有元素必定存在两个元素，这两个元素有一个特点就是它的相邻元素只有一个，而且它在adjacentPairs 所有元素中只出现一次，这两个元素即为要返回数组的头和尾
// 用map建立一个相邻元素的映射表，key为当前元素，value 为它的相邻元素，则可以知道如果是头尾的元素则它的 value 长度为1，中间的元素长度则为2
// 然后可以随机定义一个value 长度为1的为开始位置，定义一个指针依次在map中找到它的下一个相邻元素一只找到 map[key] 的长度为为1则表示已经到了结尾了，此时就可以结束遍历，
// 此时返回的数组就是要找的数组
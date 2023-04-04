void main(List<String> args) {}

/**
 * 给你一个 有序 数组 nums ，它由 n 个非负整数组成，同时给你一个整数 maximumBit 。你需要执行以下查询 n 次：

找到一个非负整数 k < 2maximumBit ，使得 nums[0] XOR nums[1] XOR ... XOR nums[nums.length-1] XOR k 的结果 最大化 。k 是第 i 个查询的答案。
从当前数组 nums 删除 最后 一个元素。
请你返回一个数组 answer ，其中 answer[i]是第 i 个查询的结果。
提示：

nums.length == n
1 <= n <= 105
1 <= maximumBit <= 20
0 <= nums[i] < 2^maximumBit
nums​​​ 中的数字已经按 升序 排好序。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/maximum-xor-for-each-query
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
List<int> getMaximumXor(List<int> nums, int maximumBit) {
  List<int> answer = List.filled(nums.length, 0);
  int total = 0;
  int max = (1 << maximumBit) - 1;
  for (var i = 0; i < nums.length; i++) {
    total = total ^ nums[i];
    int k = total ^ max;
    answer[nums.length - i - 1] = k;
  }

  return answer;
}

/**
 * 思路：由于 0 <= nums[i] < 2^maximumBit ，同时根据异或算法的特性可以知道 n xor m 如果想要最大则值的二进制应为 1111111，所以 n xor 111111 的结果就是 m。
 * 又因为  0 <= nums[i] < 2^maximumBit ，2^maximumBit为 1 << maximumBit 二进制为 0100000， 所以它减一可得 0011111，所以 n xor (2^maximumBit -1) 即为 m
 * 也就是所要求的k值。
 * 所以值需要遍历一遍 nums 同时逐个进行 xor 运算再与 (2^maximumBit -1) 进行 xor 就可以得到 answer列表
 */

import 'dart:math';

/**
 * 给你一个 n x n 的 方形 整数数组 matrix ，请你找出并返回通过 matrix 的下降路径 的 最小和 。

下降路径 可以从第一行中的任何元素开始，并从每一行中选择一个元素。在下一行选择的元素和当前行所选元素最多相隔一列（即位于正下方或者沿对角线向左或者向右的第一个元素）。具体来说，位置 (row, col) 的下一个元素应当是 (row + 1, col - 1)、(row + 1, col) 或者 (row + 1, col + 1) 。

输入：matrix = [[2,1,3],[6,5,4],[7,8,9]]
输出：13
解释：如图所示，为和最小的两条下降路径   1,5,7     1,4,8

输入：matrix = [[-19,57],[-40,-5]]
输出：-59
解释：如图所示，为和最小的下降路径

n == matrix.length == matrix[i].length
1 <= n <= 100
-100 <= matrix[i][j] <= 100

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/minimum-falling-path-sum
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

void main(List<String> args) {
  print(minFallingPathSum([
    [2, 1, 3],
    [6, 5, 4],
    [7, 8, 9]
  ]));
}

int minFallingPathSum(List<List<int>> matrix) {
  //从最后一行往上查找
  List<List<int>> dp = [];
  dp.add(matrix[0]);
  for (int i = 1; i < matrix.length; i++) {
    dp.add(List.filled(matrix.length, 100000));
    for (var j = 0; j < matrix.length; j++) {
      int mn = dp[i - 1][j];
      if (j > 0) {
        mn = min(mn, dp[i - 1][j - 1]);
      }

      if (j < matrix.length - 1) {
        mn = min(mn, dp[i - 1][j + 1]);
      }

      dp[i][j] = mn + matrix[i][j];
    }
  }

  dp[matrix.length - 1].sort();
  return dp[matrix.length - 1].first;
}

//动态规划

/**
 * 每个坐标仅可以通过它的上一排紧邻的三个坐标到达（左上，正上，右上），根据贪心思想，每个坐标的和最小下降路径长度即为它的上一排紧邻的三个坐标的
 * 最小下降路径长度的最小值，再加上当前坐标的和。用  dp 表示最小下降路径长度的话，即为
 *  dp[i][j]=matrix[i][j]+min(dp[i−1][j−1],dp[i−1][j],dp[i−1][j+1])，
 * 第一列和最后一列有边界情况，需要特殊处理。而第一行每个元素的和最小下降路径长度为它们本身的值。最后返回最后一行的和最小下降路径长度的最小值即可。
 * 
 * 更通俗些就是 dp 存储了所有到 dp[i][j] 时的最小路径，然后我们只需要计算dp 最后一行的最小值即为最小下降路径和
 * 
 */
import 'dart:math';

void main(List<String> args) {
  print(minHeightShelves([
    [1, 3],
    [2, 4],
    [3, 2]
  ], 6));
}

/**
 * 给定一个数组 books ，其中 books[i] = [thicknessi, heighti] 表示第 i 本书的厚度和高度。你也会得到一个整数 shelfWidth 。

按顺序 将这些书摆放到总宽度为 shelfWidth 的书架上。

先选几本书放在书架上（它们的厚度之和小于等于书架的宽度 shelfWidth ），然后再建一层书架。重复这个过程，直到把所有的书都放在书架上。

需要注意的是，在上述过程的每个步骤中，摆放书的顺序与你整理好的顺序相同。

例如，如果这里有 5 本书，那么可能的一种摆放情况是：第一和第二本书放在第一层书架上，第三本书放在第二层书架上，第四和第五本书放在最后一层书架上。
每一层所摆放的书的最大高度就是这一层书架的层高，书架整体的高度为各层高之和。

以这种方式布置书架，返回书架整体可能的最小高度。
提示：

1 <= books.length <= 1000
1 <= thicknessi <= shelfWidth <= 1000
1 <= heighti <= 1000

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/filling-bookcase-shelves
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
int minHeightShelves(List<List<int>> books, int shelfWidth) {
  // 用一个数组记录每一层的高度
  int minHeight = 0;
  List<int> dp = List.filled(books.length, 1000 * 1000);
  dp[0] = 0;
  for (var i = 0; i < books.length; i++) {
    int tw = books[i][0];
    int height = books[i][1];
    // 开始就先把它放在下一层
    minHeight = minHeight + height;
    dp[i] = minHeight;
    print(dp[i]);
    int j = i - 1;
    // 尝试把前一本书拿到同一层看看是否高度能减小，如果能再拿前前本书
    while (j >= 0) {
      // 计算一下将上本书放在这一层后宽度是否超过了
      tw = tw + books[j][0];
      print("tw$tw");
      if (tw > shelfWidth) {
        // 如果超过了则直接返回
        break;
      }
      // 前一本书和当前书放在同一层后的当前层高度
      height = max(books[j][1], height);
      print("Adadad$height");
      // 前一本书和当前书放在同一层后的总高度高度 dp[j - 1] + height
      // 比较一下 当前的的总高度
      if (j - 1 >= 0) {
        dp[i] = min(dp[i], dp[j - 1] + height);
      } else {
        dp[i] = min(dp[i], height);
      }
      j--;
    }

    // 记录下截止当前书的最优解
    minHeight = dp[i];
  }

  return minHeight;
}
// 思路： 可以看作是一个二叉树，假设左节点为摆在当前书的同层，右节点为当前书的下一层，向右节点探索时高度加上子节点的高度，
// 向左节点探索时如果子节点值大于当前节点则加上当前的值，小于则不加，同时还要注意左节点的宽度问题，如果超宽则只能向右节点执行
// 貌似不行   算法复杂度太高了，节点构造是个问题。。。
/**
 * books = [[1,1],[2,3],[2,3],[1,1],[1,1],[1,1],[1,2]], shelf_width = 4
 * 动态规划问题， 遍历书，把当前的书当作最后一本书，求当前的最优解，比如第一本书（高度1）的时候，高度肯定是当前高度，
 * 然后再加第二本书（高度3） 此时 如果能放在同一层则高度为最高的书，3
 * 再加入第三本书 （高度3） 此时计算是否超过宽度，如果超过则放在下一层，此时总高度为 6。那么反向查询一下是否可以将第二本和第三本放在同一层，此时总高度为4，则保留当前
 * 加入第四本书（高度1） 计算是否超过宽度，是，放在下一层，此时总高度为 5，反向查询一下将第三本和第四本放在同一层，此时总高度为 1+3+3=7，
 *  再将三四本看作一个整体，尝试看看是否能将第二本书和他们放在一层，不能，宽度过大， 则最佳总高度为5，摆放顺序为 1，33，1
 * 加入第五本书（高度1） 依次类推
 */

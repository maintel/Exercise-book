//Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main(List<String> args) {
  TreeNode treeNode = TreeNode(1, TreeNode(4), TreeNode(2, null, TreeNode(3)));
  print(preorderTraversal2(treeNode));
  print(preorderTraversal3(treeNode));
}

List<int> test(int n) {
  if (n == 0) {
    return [];
  }
  if (n == 1) {
    return [1];
  }
  if (n == 2) {
    return [2, 2];
  }
  List<int> test = [];
  test.add(1);
  test.add(1);
  for (var i = 2; i < n; i++) {
    test.add(test[i - 1] + test[i - 2]);
  }
  return test;
}

/**
 * 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 * 提示：

树中节点数目在范围 [0, 100] 内
-100 <= Node.val <= 100
 

进阶：递归算法很简单，你可以通过迭代算法完成吗？
 */
List<int> preorderTraversal(TreeNode? root) {
  if (root == null) {
    return [];
  }
  List<int> preorder = [];
  preorder.add(root.val);
  if (root.left != null) {
    preorder.addAll(preorderTraversal(root.left));
  }
  if (root.right != null) {
    preorder.addAll(preorderTraversal(root.right));
  }
  return preorder;
}

// 迭代算法的要点在于如何在某个子节点遍历完以后找到它的前序节点，思路就是用一个list存起来。

// 迭代算法
// 这个算法的思路就是用一个list从跟节点开始把右、左节点入栈，然后读取栈顶的节点同时把栈顶节点出栈，同时把栈顶节点的右、左节点入栈，
// 以此类推每次读栈顶的元素就是先从左节点读取的，直到栈为空表示读取完了。
List<int> preorderTraversal2(TreeNode? root) {
  if (root == null) {
    return [];
  }
  List<int> preorder = [];
  // 添加跟节点
  preorder.add(root.val);
  List<TreeNode?> stack = [];
  // 先入栈右节点，再入栈左节点，这样能保证倒序读取 stack 时先读到做节点
  stack.add(root.right);
  stack.add(root.left);

  while (stack.length != 0) {
    TreeNode? temp = stack.last;
    stack.removeLast();
    if (temp != null) {
      preorder.add(temp.val);
      print(temp.val);
      stack.add(temp.right);
      stack.add(temp.left);
    }
  }

  return preorder;
}

// 这里的思路是先把所有左节点入栈，然后出栈根据读取栈顶节点的右节点，
// 然后在此把栈顶节点所有子节点的左节点入栈，
// 以此类推直到遍历完所有节点 不如 preorderTraversal2 好
List<int> preorderTraversal3(TreeNode? root) {
  if (root == null) {
    return [];
  }
  List<int> preorder = [];
  List<TreeNode?> stack = [];
  TreeNode? key = root;
  while (key != null || stack.length != 0) {
    while (key != null) {
      preorder.add(key.val);
      stack.add(key);
      key = key.left;
    }
    var temp = stack.last;
    stack.removeLast();
    key = temp?.right;
  }

  return preorder;
}

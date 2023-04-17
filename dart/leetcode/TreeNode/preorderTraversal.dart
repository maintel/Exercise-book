//Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main(List<String> args) {
  print(test(6));
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

// 迭代算法
List<int> preorderTraversal2(TreeNode? root) {
  if (root == null) {
    return [];
  }
  List<int> preorder = [];
  preorder.add(root.val);
  // 右节点表示root树的父节点，左节点表示当前遍历的节点
  TreeNode temp = TreeNode();
  temp.right = root;
  temp.left = root.left;
  while (temp.left != null || temp.right != null) {
    // 如果左节点不为空
    preorder.add(temp.left!.val);
    // 如果下一个左节点不为空
    if (temp.left!.left != null) {
      // 移动右节点为当前节点
      temp.right = temp.left;
      // 左节点为遍历节点
      temp.left = temp.left!.left;
      preorder.add(temp.left!.val);
    } else if (temp.left!.right != null) {
      //否则判断下一个右节点是否为空
      temp.right = temp.left;
      temp.left = temp.left!.right;
      preorder.add(temp.left!.val);
    } else {
      // 否则向回退
      temp = temp.right!;
      temp.left = temp.right;
    }
  }

  return preorder;
}

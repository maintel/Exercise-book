void main(List<String> args) {
  
}
int numberOfSteps(int num) {
  if (num == 0) {
    return 0;
  }
  int i = 1;
  while (num != 0) {
    i++;
    if (num % 2 == 0) {
      num = num ~/ 2;
    } else {
      num = num - 1;
    }
  }
  return i;
}

int maximumWealth(List<List<int>> accounts) {
  int total = 0;
  accounts.forEach((element) {
    int current = 0;
    element.forEach((element) {
      current += element;
    });
    if (current > total) {
      total = current;
    }
  });
  return total;
}

List<String> fizzBuzz(int n) {
  List<String> s = [];
  for (var i = 1; i <= n; i++) {
    if (i % 15 == 0) {
      s.add("FizzBuzz");
    } else if (i % 5 == 0) {
      s.add("Buzz");
    } else if (i % 3 == 0) {
      s.add("Fizz");
    } else {
      s.add("$i");
    }
  }
  return s;
}

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
 * Definition for singly-linked list.

 */
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? middleNode(ListNode? head) {
  ListNode? slow = head;
  ListNode? fast = head;
  while (fast?.next != null && fast?.next != null) {
    slow = slow?.next;
    fast = fast?.next?.next;
  }
  return slow;
}

bool canConstruct(String ransomNote, String magazine) {
  if (magazine.length < ransomNote.length) {
    return false;
  }

  List<int> as = List.filled(26, 0);
  for (var value in magazine.codeUnits) {
    as[value - 97]++;
  }
  for (var value in ransomNote.codeUnits) {
    as[value - 97]--;
    if (as[value - 97] < 0) {
      return false;
    }
  }

  return true;
}

class StreamChecker {
  Map<String, int> words = {};
  StreamChecker(List<String> words) {
    for (var element in words) {
      this.words[element] = 0;
    }
  }

  List<String> qString = [];
  bool query(String letter) {
    qString.add(letter);
    return false;
  }
}
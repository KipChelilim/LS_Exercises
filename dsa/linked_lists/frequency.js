/*
time 948 - 1010

takeaways:
  nailed it
  clean up loop mechanism, map being more efficient than regular object, just grab values, etc

Problem:
  input: singly linked list of integers
  output: new list of frequencies for unique elements
  rules:
    accept a list of integers
    create a new list of frequencies of unique numbers
      ex: 1, 1, 2, 1, 3 becomes 3 (1s), 1 (2s) and 1 (3s)
Algorithm
  thoughts
    frequencies:
      create a map object
      log frequencies as I traverse the node
        would result in O(2N) as i would need to iterate
      update count of node as i iterate
        for each node, start from head of new list, if not equal next, if equal increment
*/

function createFrequencyList(list) {
  let curr = list;
  let frequencies = {}

  while (curr) {
    frequencies[curr.val] ??= 0;
    frequencies[curr.val] += 1;
    curr = curr.next
  }

  let dummy = new ListNode();
  let newListCurrNode = dummy;

  for (const num in frequencies) {
    newListCurrNode.next = new ListNode(frequencies[num]);
    newListCurrNode = newListCurrNode.next;
  }

  return dummy.next;
}

function ListNode(val) {
  this.val = val;
  this.next = null;
}

function createLinkedList(arr) {
  let head = new ListNode(0);
  let current = head;
  arr.forEach(val => {
    current.next = new ListNode(val);
    current = current.next;
  });
  return head.next;
}

function linkedListToArray(head) {
  let result = [];
  while (head) {
    result.push(head.val);
    head = head.next;
  }
  return result;
}

function testFrequencyList(input, expected) {
  let result = linkedListToArray(createFrequencyList(createLinkedList(input)));
  if (result.length !== expected.length) return false;
  let freq1 = new Map(), freq2 = new Map();
  for (let num of result) freq1.set(num, (freq1.get(num) || 0) + 1);
  for (let num of expected) freq2.set(num, (freq2.get(num) || 0) + 1);
  if (freq1.size !== freq2.size) return false;
  for (let [key, value] of freq1) {
    if (freq2.get(key) !== value) return false;
  }
  return true;
}

// Test cases
console.log(testFrequencyList([1, 1, 2, 1, 3], [3, 1, 1]));
console.log(testFrequencyList([1, 1, 2, 2, 2], [2, 3]));
console.log(testFrequencyList([6, 5, 4, 3, 2, 1], [1, 1, 1, 1, 1, 1]));
console.log(testFrequencyList([4, 4, 4, 4], [4]));
console.log(testFrequencyList([1, 2, 3, 4, 5], [1, 1, 1, 1, 1]));
console.log(testFrequencyList([], []));
console.log(testFrequencyList([1, 1, 1], [3]));
console.log(testFrequencyList([1, 2, 1, 2, 1, 2], [3, 3]));
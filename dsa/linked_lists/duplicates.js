/*
time 802 - 833

takeaways: 
  need to brush up on linked lists
  unnecessary space complexity using a set when list is sorted
  if you dont use set and just compare prev vs next, you can skip the dummy pointer

Problem
  input: head of list
  output: head of list
  rules:
    accept a singly linked list
    remove duplicate elements
    maintain sort of linked list
Examples
Data Structure
Algorithm
  initialize currNode to head
  initialize prev node to dummy node

  while currNode is not null
    if value is in set
      set prev.next to curr.next
    else
      add value to set
    set curr to curr.next
*/

function deleteDuplicates(head) {
  let curr = head
  let dummy = new ListNode(null);
  let prev = dummy
  dummy.next = head

  let uniqueValues = new Set();

  while (curr !== null) {
    if (uniqueValues.has(curr.val)) {
      prev.next = curr.next;
    } else {
      uniqueValues.add(curr.val);
      prev = prev.next
    }

    curr = curr.next;
  }

  return head;
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

function printLinkedList(head) {
  let currentNode = head;
  let listStr = '';
  while (currentNode !== null) {
      listStr += currentNode.val + ' -> ';
      currentNode = currentNode.next;
  }
  listStr += 'null'; // Indicate the end of the list
  console.log(listStr);
}

let list1 = createLinkedList([1, 1, 2]);
let list2 = createLinkedList([1, 1, 2, 3, 3]);
let list3 = createLinkedList([1, 2, 3, 3, 4]);
let list4 = createLinkedList([2, 2, 2, 3, 3]);
let list5 = createLinkedList([5]);

printLinkedList(deleteDuplicates(list1)); // Expected: "1 -> 2 -> null"
printLinkedList(deleteDuplicates(list2)); // Expected: "1 -> 2 -> 3 -> null"
printLinkedList(deleteDuplicates(list3)); // Expected: "1 -> 2 -> 3 -> 4 -> null"
printLinkedList(deleteDuplicates(list4)); // Expected: "2 -> 3 -> null"
printLinkedList(deleteDuplicates(list5)); // Expected: "5 -> null"
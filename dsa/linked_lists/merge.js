/*
time
takeaways:
  you're not rebuilding a new object.
  you're using the existing node objects to create a pseudo "list"
    which is just the collective trail of links in the next property of each node
  don't focus on trying to recreate a "new" list
  just repoint each link until you no longer need to repoint anything
  similar concept to deleting or removing duplicates
  the point of a linked list is to manipulate the links to replicate a connected object
  any nodes no longer needed can be ignored
  any nodes already linked in the desired order can be ignored

Problem:
  input: two lists sorted in ascending order
  output: a single mergeed list
  rules:
    accept two lists
      they are sorted in ascending order
      they have values that potentially overlap or are duplicates
    merge the lists together
      new list should have all nodes from both lists
      should be sorted in ascending order
    return merged list
Examples
  add a duplicate example
Algorithm
  initialize new list
  initialize curr as dummy node
  initialize list1CurrNode to head of first node
  initialize list2currNode to head of 2nd node

  while one node is not null
    if node1 === node2 and node1 is not null
      curr.next = node1
      node1 = next
    if node2 === null || node1 < node2
      curr.next = new node with node 1
      node1 = node1.next
    if node1 === null || node2 > node1
      curr.next = node2
      node2 = next
    end

  return dummy.next
*/

function mergeSortedLists(list1, list2) {
  let dummy = new ListNode(null);
  let curr = dummy;

  let list1Curr = list1;
  let list2Curr = list2;

  while (list1Curr && list2Curr) {
    if (list1Curr === null) {
      curr.next = list2Curr;
      list2Curr = list2Curr.next;
      break;
    } else if (list2Curr === null) {
      curr.next = list1Curr;
      list1Curr = list1Curr.next;
      break;
    } else if (list1Curr.val <= list2Curr.val) {
      curr.next = list1Curr;
      list1Curr = list1Curr.next;
    } else if (list1Curr.val > list2Curr.val) {
      curr.next = list2Curr;
      list2Curr = list2Curr.next;
    }

    curr = curr.next;
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
function printLinkedList(head) {
  let current = head;
  let listStr = '';
  while (current !== null) {
    listStr += current.val + ' -> ';
    current = current.next;
  }
  listStr += 'null';
  console.log(listStr);
}

let list1 = createLinkedList([1, 3, 5]);
let list2 = createLinkedList([2, 4, 6]);
printLinkedList(mergeSortedLists(list1, list2)); // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> null

let list3 = createLinkedList([1, 2, 3]);
let list4 = createLinkedList([]);
printLinkedList(mergeSortedLists(list3, list4)); // Expected: 1 -> 2 -> 3 -> null

let list5 = createLinkedList([]);
let list6 = createLinkedList([1]);
printLinkedList(mergeSortedLists(list5, list6)); // Expected: 1 -> null

let list7 = createLinkedList([1, 5, 9]);
let list8 = createLinkedList([2, 4, 6, 8, 10]);
printLinkedList(mergeSortedLists(list7, list8)); // Expected: 1 -> 2 -> 4 -> 5 -> 6 -> 8 -> 9 -> 10 -> null

let list9 = createLinkedList([1, 2, 5]);
let list10 = createLinkedList([3, 6, 7]);
printLinkedList(mergeSortedLists(list9, list10)); // Expected: 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> null

let list11 = createLinkedList([1, 2, 5]);
let list12 = createLinkedList([2, 4, 6]);
printLinkedList(mergeSortedLists(list11, list12)); // Expected: 1 -> 2 -> 2 -> 4 -> 5 -> 6 -> null
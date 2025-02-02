function nodeSwap(id1, id2) {
  let node1 = document.getElementById(id1);
  let node2 = document.getElementById(id2);

  if (!node1 || !node2) { // invalid id
    return undefined;
  } else if (node1.contains(node2) || node2.contains(node1)) { // nested elements
    return undefined;
  }

  let node2Parent = node2.parentNode;
  let node2Anchor = node2.nextSibling;
  node1.parentNode.insertBefore(node2, node1);
  node2Parent.insertBefore(node1, node2Anchor);
}

window.onload = () => {
}
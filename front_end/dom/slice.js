function reverseWalk(node, callback, continueWalk) {
  callback(node);
  if (continueWalk(node)) reverseWalk(node.parentNode, callback, continueWalk);
}

function sliceTree(start, end) {
  let result = [];

  function addElementTagName(element) {
    result.unshift(element.tagName);
  }

  function continueWalk(element) {
    return element.id !== String(start);
  }

  let startElement = document.getElementById(start);
  let endElement = document.getElementById(end);
  if (start && end && startElement.contains(endElement)) {
    reverseWalk(endElement, addElementTagName, continueWalk)
  } else {
    return undefined;
  }

  return result;
}

window.onload = () => {
  console.log(sliceTree(1, 4));
  console.log(sliceTree(1, 76));
  console.log(sliceTree(2, 5));
  console.log(sliceTree(5, 4));
  console.log(sliceTree(1, 23));
  console.log(sliceTree(1, 22));
  console.log(sliceTree(11, 19));
}
"use strict;"

function reverseWalk(element, callback, breakCondition) {
  callback(element);
  if (!breakCondition(element)) {
    reverseWalk(element.parentElement, callback, breakCondition);
  }
}

function domTreeTracer(id) {
  let result = [];
  let parent = document.getElementById(id).parentElement;

  function getSiblings(parent) {
    let siblings = Array.from(parent.children, (element) => element.tagName);
    result.push(siblings);
  }

  function isBeyondGrandestParent(element) {
    return !!element.children.namedItem('1');
  }

  reverseWalk(parent, getSiblings, isBeyondGrandestParent)
  console.log(result);
}

window.onload = () => {
  domTreeTracer(22);
}
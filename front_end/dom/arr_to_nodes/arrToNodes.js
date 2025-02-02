function arrayToNodes(nodes, parent) {
  let [elementType, children] = nodes;
  let node;

  if (elementType === 'BODY') {
    node = document.body
  } else {
    node = document.createElement(elementType);
    parent.append(node);
  }

  children.forEach((child) => arrayToNodes(child, node));
}

window.onload = () => {
  // const nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
  const nodes = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];
  arrayToNodes(nodes);
}
  /* create an array of dom elements
  start from the body of the dom
  dom element is represented as ['tagname', [...other elements]]
  if dom has no elements, it gets an empty array
  using body as an example, with a header main section and footer and nothing else
    [ body, [
        header, [],
        main, [],
        footer, []
      ]
    ]
  above if there was p tag in the main section
      [ body, [
        header, [],
        main, [
          p, []
        ],
        footer, []
      ]
    ]

  algorithm
    ideas
      if the element has no children, return an array of tagname and empty array
      if element has children, for each child
        push return value from recursive call to result
      return result
  */
function nodesToArr(node = document.body) {
  let result = [node.tagName, []];
  if (node.children.length > 0) {
    for (let i = 0; i < node.children.length; i += 1) {
      result[1].push(nodesToArr(node.children[i]));
    }
  }
  return result;
}
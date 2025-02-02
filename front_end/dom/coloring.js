function colorGeneration(targetGeneration) {
  function walkGenerations(node, currGen) {
    currGen += 1;
    let children = node.children;
    for (let i = 0; i < children.length; i += 1) {
      let child = children[i];
      if (currGen === targetGeneration) {
        child.classList.add('generation-color');
      } else {
        walkGenerations(child, currGen);
      }
    }
  }

  walkGenerations(document.body, 0);
}

window.onload = () => {
  colorGeneration(7);
}
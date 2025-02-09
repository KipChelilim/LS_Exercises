window.onload = () => {
  document.querySelector('main').addEventListener('contextmenu', (event) => {
    event.preventDefault();
    event.stopPropagation();
    let elementName = event.target.id || event.target.tagName
    alert(elementName.toLowerCase());
  })
}
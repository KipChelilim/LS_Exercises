window.onload = () => {
  function makeBold(element, callback) {
    element.style.fontWeight = 'bold';
    callback(element);
  }

  let sectionElement = document.querySelector('section');
  makeBold(sectionElement, function(elem) {
    elem.classList.add('highlight');
  });

  console.log(sectionElement.classList.contains('highlight'));
  console.log(sectionElement.style.fontWeight);
};

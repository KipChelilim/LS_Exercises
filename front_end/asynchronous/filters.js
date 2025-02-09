const animalsFilter = {
  'Classifications': ['Animals', 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
  'Vertebrate': ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
  'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
  'Cold-blooded': ['Salmon', 'Turtle'],
  'Mammal': ['Bear', 'Whale'],
  'Bird': ['Ostrich'],
}

const classificationsFilter = {
  'Animals': ['Classifications', 'Vertebrate', 'Warm-blooded', 'Mammal', 'Bird'],
  'Bear': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Turtle': ['Vertebrate', 'Cold-blooded'],
  'Whale': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Salmon': ['Vertebrate', 'Cold-blooded'],
  'Ostrich': ['Vertebrate', 'Warm-blooded', 'Bird'],
}

function getClassificationsList() {
  return Object.keys(animalsFilter);
}

function getAnimalsList() {
  return Object.keys(classificationsFilter);
}

function createOptionsList(...args) {
  let options;
  let filter;
  let optionsString;

  if (Array.isArray(args[0])) {
    options = args[0];
  } else {
    filter = args[0];
    optionsString = args[1];
    options = filter[optionsString];
  }

  return optionElements = options.map((optionText) => {
    const option = new Option(optionText, optionText);
    if (optionText === 'Animals' || optionText == 'Classifications') option.defaultSelected = true;
    return option;
  });
}

window.onload = () => {
  let classificationsSelect = document.querySelector('#animal-classifications');
  let animalsSelect = document.querySelector('#animals');
  let clear = document.querySelector('#clear');

  animalsSelect.addEventListener('change', (event) => {
    event.stopPropagation();
    const newClassificationsOptions = createOptionsList(classificationsFilter, animalsSelect.value);
    classificationsSelect.replaceChildren(...newClassificationsOptions)
  });

  classificationsSelect.addEventListener('change', (event) => {
    event.stopPropagation();
    const newAnimalsOptions = createOptionsList(animalsFilter, classificationsSelect.value);
    animalsSelect.replaceChildren(...newAnimalsOptions);
  });

  clear.addEventListener('click', (event) => {
    event.preventDefault();
    event.stopPropagation();

    const newAnimalsOptions = createOptionsList(getAnimalsList());
    const newClassificationsOptions = createOptionsList(getClassificationsList());

    classificationsSelect.replaceChildren(...newClassificationsOptions);
    animalsSelect.replaceChildren(...newAnimalsOptions);
  });
}
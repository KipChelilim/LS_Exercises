function delegateEvent(parentElement, selector, eventType, callback) {
  if (!parentElement) return undefined;

  parentElement.addEventListener(eventType, (event) => {
    event.stopPropagation();
    const childElements = Array.from(parentElement.querySelectorAll(selector));
    if (childElements.includes(event.target)) callback(event);
  });

  return true;
}
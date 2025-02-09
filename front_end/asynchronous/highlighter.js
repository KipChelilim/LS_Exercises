function toggleHighlightClass(element) {
  let highlightedArticles = document.querySelectorAll('.highlight') || [];
  highlightedArticles.forEach((article) => article.classList.remove('highlight'));
  element.classList.add('highlight');
}

document.addEventListener('DOMContentLoaded', (event) => {
  let anchors = document.querySelectorAll('a');
  let articles = document.querySelectorAll('article');
  anchors.forEach((anchor) => {
    anchor.addEventListener('click', (event) => {
      event.stopPropagation();
      let articleName = anchor.getAttribute('href')
      let article = document.querySelector(articleName);
      toggleHighlightClass(article);
    })
  });

  // articles when clicked anywhere within, highlight entire article but stop
  articles.forEach((article) => {
    article.addEventListener('click', (event) => {
      event.stopPropagation();
      toggleHighlightClass(event.currentTarget);
    });
  });

  // main when clicked anywhere else, highlight entire article but stop there
  document.querySelector('main').addEventListener('click', (event) => {
    event.stopPropagation();
    toggleHighlightClass(event.target);
  }, true);
});
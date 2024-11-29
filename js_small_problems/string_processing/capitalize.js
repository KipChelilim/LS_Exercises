const wordCap = function capitalizeEachWord(string) {
  return string.replace(/(\S)(\S*)/g, (_, first, remaining) => first.toUpperCase() + remaining);
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
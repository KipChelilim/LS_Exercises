const wordSizes = function wordSizeFrequencyTable(string) {
  let wordSizeCounts = {};
  if (string.length === 0) return wordSizeCounts;

  string.split(' ').forEach(word => {
    size = word.length;
    wordSizeCounts[size] ??= 0;
    wordSizeCounts[size] += 1;
  });

  return wordSizeCounts;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}
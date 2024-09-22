const wordSizes = function wordSizeFrequencyTable(string) {
  let wordSizeCounts = {};
  let cleanString = string.replace(/[^a-z\s]/gi, '');
  if (cleanString.length === 0) return wordSizeCounts;

  cleanString.split(' ').forEach(word => {
    size = word.length;
    wordSizeCounts[size] ??= 0;
    wordSizeCounts[size] += 1;
  });

  return wordSizeCounts;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}
/*
start 1215
end 1259

Problem:
  input: string
  output: string with all chars in each word reversed
  rules:
    - accept a sentence `str`
      - the sentence contains words delimited by spaces
      - words can contain upper and lower case
      - words can contain punctuation
        - these characters should be part of the word if they are not space delimited:
          - '-
      - the following punctuation is not part of a word:
        - ?!.;,()[]{}/
    - reverse the characters of each word in the sentence
      - maintain case of each character
      - ignore non-word punctuation
      - include word punctuation when part of the word
    - spaces between words should be preserved in their original position
    - order of the words in the sentence should be preserved
  questions:
    - are all words delimited by spaces? - yes
    - can there be punctuation? how should punctuation be treated?
      - preserve word / sentence delimiters, treat all others as part of the word
    - what about hypenated words or words with non-alphabetic chars?
      - if part of the word and not a sentence ending char, reverse it
    - how should numeric characters be treated?
      - if its not a sentence ending char, reverse it
Examples:
  expected inputs: clean string
    - one word -> new
    - two or more words -> given
    - word with sentence punctuation -> new
    - word with non-sentence punctuation -> new
    - word containing numeric characters -> new
    - word with only numeric characters -> new
  malformed inputs:
    -
  emtpy string -> new
  extra inputs: n/a
  non-string: n/a
Data Structure:
  - array for each word
    - array to contain each string char after reversal
  - str when rejoining
  - regex for population
Algorithm
  main program:
    - if string is emtpy return an empty string
    - split string into `words`
    - transform each word -> reverseChars(word)
    - return words joined with spaces
  helpers:
    - isNonWordPunctuation
      - return char does not match regex /[?!.;,()[]{}/]/
    - reverseChars
      - initialize array for result
      - initialize pointers at start and end of word
      - while start pointer is less than end pointer
        - if start char is isNonWordPunctuation, move pointer forward and continue
        - if end char is isNonWordPunctuation, move pointer back and continue
        - otherwise, assign array at start index to char at end index, and end index to char at start
        - move both pointers closer
*/

function reverseWords(str) {
  if (str.length === 0) return '';

  let words = str.split(' ');
  return words.map(reverseChars).join(' ');
}


function isNonWordPunctuation(char) {
  return /[?!.;,()[\]{}/ ]/.test(char);
}

function reverseChars(str) {
  let reversedStrChars = [];
  let start = 0;
  let end = str.length - 1;

  while (start <= end) {
    if (isNonWordPunctuation(str[start])) {
      reversedStrChard[start] = str[start];
      start += 1;
      continue;
    } else if (isNonWordPunctuation(str[end])) {
      reversedStrChard[end] = str[end];
      end -=1;
      continue;
    } else {
      reversedStrChard[start] = str[end];
      reversedStrChard[end] = str[start];
    }

    start += 1;
    end -= 1;
  }

  return reversedStrChard.join('');
}


console.log(reverseWords("Hello World") === "olleH dlroW");
console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
console.log(reverseWords("Launch School") === "hcnuaL loohcS");
console.log(reverseWords("Hello") === "olleH");
console.log(reverseWords("Hello!") === "olleH!");
console.log(reverseWords("'ello") === "olle'");
console.log(reverseWords("The variable is test1") === "ehT elbairav si 1tset");
console.log(reverseWords("12345") === "54321");
console.log(reverseWords("") === "");
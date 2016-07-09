const PigLatin = function() {};

PigLatin.translate = function(input) {
  return input.split(' ').map(PigLatin.pigWord).join(' ');
};

PigLatin.pigWord = function(input) {
  const vowelSounds = ['a', 'e', 'i', 'o', 'u'];
  const consonantSets = ['ch', 'th', 'thr', 'sch', 'qu', 'squ'];
  let startsVowel = false;
  let startLetters = '';
  vowelSounds.forEach((i) => {
    if (input.startsWith(i)) {
      startsVowel = true;
      startLetters = i;
    }
  });
  consonantSets.forEach((i) => {
    if (input.startsWith(i)) {
      startLetters = i;
    }
  });

  if (startsVowel) {
    return `${input}ay`;
  }
  if (startLetters.length == 0) { startLetters = input[0]; }
  return `${input.slice(startLetters.length)}${startLetters}ay`;
};

module.exports = PigLatin;

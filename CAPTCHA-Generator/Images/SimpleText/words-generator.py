import random

f = open("5LetterWords.txt", "a+")

noOfWordsToGenerate = 286000

alphabets =	{
  1: 'a',
  2: 'b',
  3: 'c',
  4: 'd',
  5: 'e',
  6: 'f',
  7: 'g',
  8: 'h',
  9: 'i',
  10: 'j',
  11: 'k',
  12: 'l',
  13: 'm',
  14: 'n',
  15: 'o',
  16: 'p',
  17: 'q',
  18: 'r',
  19: 's',
  20: 't',
  21: 'u',
  22: 'v',
  23: 'w',
  24: 'x',
  25: 'y',
  26: 'z'
}

count = 1;
fiveLetterWord = [0, 0, 0, 0, 0]

for i in range(noOfWordsToGenerate):
	randomAlphabet_1 = random.randint(1, 26)
	randomAlphabet_2 = random.randint(1, 26)
	randomAlphabet_3 = random.randint(1, 26)
	randomAlphabet_4 = random.randint(1, 26)
	randomAlphabet_5 = random.randint(1, 26)

	fiveLetterWord[0] = alphabets[randomAlphabet_1]
	fiveLetterWord[1] = alphabets[randomAlphabet_2]
	fiveLetterWord[2] = alphabets[randomAlphabet_3]
	fiveLetterWord[3] = alphabets[randomAlphabet_4]
	fiveLetterWord[4] = alphabets[randomAlphabet_5]

	print("Generating word "+str(count));
	f.write(fiveLetterWord[0] + fiveLetterWord[1] + fiveLetterWord[2] + fiveLetterWord[3] + fiveLetterWord[4] + "\n");
	count = count+1;

f.close()


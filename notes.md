
# kata 
## description
link:  https://www.codewars.com/kata/52fba66badcd10859f00097e
Trolls are attacking your comment section!

A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

Your task is to write a function that takes a string and return a new string with all vowels removed.

For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

Note: for this kata y isn't considered a vowel.

## pomodoro 1
guards:  
- [X] input must be a string: returns false if not
- [x] returns true if string submitted
- [-] returns true if specific letter submitted (e.g. "a")
- [-] returns true if string from array submitted
- [ ] 

- [-] filters items from [array of vowels] from [input]

## pomodoro 2
- [X] returns empty string if input not a string
- [X] if 'a' included in word, returns word without 'a'
- [X] if vowels included in phrase, returns phrase without vowels.  


## overview 
- break down problem statement into "atomic statements" 
- get away from writing big monolithic tests - break it down into small tests
- individual commits between red/green\
- start to think Gherkin language

﻿var NUMBER_STRIKES: int = 7; //allowed number of strikes var currentWordArray: Array; //each index contains single letter of hidden wordvar currentGuessArray: Array; //index I is true if user has correctly guessed letter at that indexvar strikes: int; //holds current number of strikes against the player/*this funciton intializes a game of "logic"A word should be randomly chosen from dictionaryVariables should be assigned accordingly*/function initGame (): void{	//define new Array for currentWordArray	currentWordArray = new Array();	//assign Array of randomWord String --> changed with string2Array function 	currentWordArray = string2Array(randomWord ());	//invokde initGuess function, to initialize currentWordArray	initGuess ();}/*this "helper" function creates a new Array for currentGuess variable and initializes all slots to be falseThink about the for-loops we have been doing in class about initialization of Arrays*/function initGuess (): void{	//length of the initGuess will be a long as length of currentWordArray	//give currentGuessArray the legnth of currentWordArray	currentGuessArray = new Array (currentWordArray.length);	//use for-loop to initialize all slots to be false		for (var i: int = 0; i<currentWordArray.length; i++){		//initialize all slots to be false		currentGuessArray[i] = 0;	}	//invoke getCurrentGuess function	getCurrentGuess ();}/*this funciton will update currentGuess variable by checking currentWord variableif the letter is not found, number of strikes should be updated*/function guessLetter (p: String): void{	//use for-loop to check each value of currentWordArray	for (var i:int=0; i<currentWordArray.length; i++){		//check if parameter p is found in currentWordArray 		if (p == currentWordArray[i]){			//if true, replace currentGuess[i] with letter from parameter p			currentGuessArray[i] = p;		}	}}/*this function should return String "?" for unrevealed lettersthis function will "walk over" currentWord and currentGuess arrays and create strings accordinglyif false at index i in currentGuess, then ? should appearif true at index i in currentGuess, then value in ith slot in currentWord should appear*/function getCurrentGuess (): String{	//define currentGuessString	var currentGuessString: String = "";	//use for-loop to "walk over" currentGuessArray	for (var i:int=0; i<currentGuessArray.length; i++){		//if false at index i in curretnGuess, then ? should appear		if (currentGuessArray[i] == 0){			//add ? in place for that character spot			currentGuessString = currentGuessString + "?";		}		//if true at index i in currentGuess, then value in ith slot of currentWord should appear		else{			//add value in ith slot of currentWord			currentGuessString = currentGuessString + currentWordArray[i];		}	}	//if currentGuessField.text (the last guessed word) is equal to the currentGuessString	if (currentGuessField.text == currentGuessString){		//invoke numberOfStrikes function to update number of strikes		numberOfStrikes();	}	//trace currentGuessString to OUTPUT window	trace ("Your current Guess is: " + currentGuessString);	//return currentGuessString to function	return currentGuessString;}/*returns number of strikes against player thus farstrikes variable will be updated each time this function in invoked*/function numberOfStrikes (): int {	//update strikes variable --> add 1 to strikes variable	strikes = strikes+1;	//return number of strikes against player so far	return strikes;}/*this function will return the reaming number of strikes a player has leftSubtract current number of Strikes from NUMBER_STRIKES variable*/function numberOfRemainingStrikes (): int {	//define variable remaningStrikes 	var remainingStrikes: int;	//remainingStrikes is equal to NUMBER_STRIKES minus strikes 	remainingStrikes = NUMBER_STRIKES - strikes;	//return remainingStrikes variable	return remainingStrikes;}/*this function will return the hidden word chosen from original dictionary Arrary*/function getAnswer (): String {	//change currentWordArray into a string which is returnable to function 	return array2String(currentWordArray);}/*this function will return true whether the game is won or lostThe game must only be over to return true*/function gameOver (): Boolean {	//true if remaining strikes equals zero	if (NUMBER_STRIKES == strikes){		return true;	}	//if not, then false	else{		return false;	}	//true if currentGuess is same as currentWord	if (array2String(currentGuessArray) == array2String(currentWordArray)){		return true;	}	//if not, then false	else{		return false;	}}/*this function will return true if player won game (guessed all letters in word)*/function gameWon (): Boolean {	//true if currentGuess=currentWord AND number of remaining strikes doesn't equal 0	if ((array2String(currentGuessArray)==array2String(currentWordArray)) && (NUMBER_STRIKES != strikes)){		return true;	}	//if not, then false	else{		return false;	}}
//
//  Game.swift
//  Apple Pie 2
//
//  Created by Student on 1/11/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

//this makes variable that word is a string and the moves remaing is an integer and guessed letter is a character
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
//player guessed is a character and when the word is a letter the incorrect moves remaining is minus 1
mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
            
        }
    }
//fomratted word is a string and guessedword is an empty string
//if the guessed letter is correct then it adds a guessed word 
    var formattedWord: String {
        var guessedWord = " "
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}










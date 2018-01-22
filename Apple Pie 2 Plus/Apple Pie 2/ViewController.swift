//
//  ViewController.swift
//  Apple Pie 2
//
//  Created by Student on 1/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
//filling the array with words for the player to guess

var listOfWords = ["Hambugers" , "Sports" , "french fries" , "glove" , "second base"]

// the constant is only allowing you to guess 6 times before you loose

let incorrectMovesAllowed = 6

// the variable allows you to have 0 wins or more or 0 losses or more
var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {
   
// when the button is pressed it is disabled(can't select a letter more then once in a round)
//when the button is clicked it reads the title. Reading the title tells if it's a normal state but the exclimation point shows this button does not have a title.
//using lower case is easier to compare(like convert string to characters)
//calling updateUI and updateGameState
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        updateGameState()
    }

//when playing the game and you have 0 more incorrect moves the loss is added to 1
//you are able to keep playing and it will call updateUI
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }

// if you win the game will be set to a new round
// if you loose it will set to a new round
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
// the image is connected to the ImageView
// the labels are connected to a UILabel
// the button contains all the buttons together and is now one UIButton
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var currentGame: Game!

// give game a initilizer by removing the first value and then incorrectMovesRemaining is allowing it to have x moves left. This happens if letters are put in
// else nothing will happen because no letters were put in
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord , incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
//the letter buttons are a type of boolean. If the buttons in letter is pressed it will be enabled
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    func updateUI() {
        var letters = [String] ()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
            
//an array that changes the characters to a string
        var stringArray = [String.self]
            var newArray = stringArray.map({_ in (String)()
         } )
    
//the text is equal to the formatted word
// the score is wins and desplays the wins also if you loose it displays the losses
//the image comes up the tree changes with how many incorrect moves you have
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins\(totalWins), Losses\(totalLosses)"
        treeImageView.image = UIImage (named: "Tree \(currentGame.incorrectMovesRemaining)")
    }


    
 
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

}

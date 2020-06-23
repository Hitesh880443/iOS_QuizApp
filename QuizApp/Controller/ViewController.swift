//
//  ViewController.swift
//  QuizApp
//
//  Created by Hitesh, Vishwas Sutar on 31/05/20.
//  Copyright © 2020 Hitesh Sutar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueAnsButton: UIButton!
    @IBOutlet weak var falseAnsButton: UIButton!
    @IBOutlet weak var quetionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var startAgain: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeState(hideStartButton: true)
        updateQuetion()
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let selectebutton = sender.currentTitle!
        
        if selectebutton == "Start Again" {
            changeState(hideStartButton: true)
            updateQuetion()
            quizBrain.currentQuetioNumber = 0
        } else {
            quizBrain.checkAnswer(selectebutton)
            if quizBrain.isQuizDone() {
                changeState(hideStartButton: false)
                quetionLabel.text = "Result is \(quizBrain.result) /  \(quizBrain.quiz.count)"
                quizBrain.result = 0
            } else {
                updateQuetion()
            }
            
        }
    }
    
    func updateQuetion(){
        progressBar.progress = quizBrain.quizProgress()
        quetionLabel.text = quizBrain.getNewQusttion()
    }
    
    func changeState(hideStartButton : Bool) {
        startAgain.isHidden = hideStartButton
        trueAnsButton.isHidden = !hideStartButton
        falseAnsButton.isHidden = !hideStartButton
        progressBar.isHidden = !hideStartButton

    }
}


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
    let quiz = [
        QuizStruct(quetion: "Delhi is capital of India", answer: "True"),
        QuizStruct(quetion: "Four - Two is equal to Two", answer: "True"),
        QuizStruct(quetion: "Biro Brothers invented the Ball Point Pen", answer: "True"),
        QuizStruct(quetion: "Television was invented by John Napier", answer: "False"),
        QuizStruct(quetion: "India is the largest tea exporter of the world", answer: "False")
    ]
    
    var result = 0
    
    var currentQuetioNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeState(hideStartButton: true)
        updateQuetion()
    }
    
    
    @IBAction func onAnsPressed(_ sender: UIButton) {
        let selectebutton = sender.currentTitle
        let actualAns =  quiz[currentQuetioNumber].answer
        
        if selectebutton == "Start Again" {
            changeState(hideStartButton: true)
            currentQuetioNumber = 0
            updateQuetion()
        } else {
            if selectebutton == actualAns {
                result+=1
            }
            
            if currentQuetioNumber+1 < quiz.count {
                currentQuetioNumber+=1
                updateQuetion()
            } else {
                changeState(hideStartButton: false)
                currentQuetioNumber = 0
                quetionLabel.text = "Result is \(result) /  \(quiz.count)"
                result = 0
               
            }
        }
    }
    
    func updateQuetion(){
        var progress : Float = Float(currentQuetioNumber+1) / Float(quiz.count)
        progressBar.progress = progress
        quetionLabel.text = quiz[currentQuetioNumber].quetion
    }
    
    func changeState(hideStartButton : Bool) {
        startAgain.isHidden = hideStartButton
        trueAnsButton.isHidden = !hideStartButton
        falseAnsButton.isHidden = !hideStartButton
        progressBar.isHidden = !hideStartButton
        
        
        
      

    }
}


//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Hitesh, Vishwas Sutar on 21/06/20.
//  Copyright © 2020 Hitesh Sutar. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        QuizStruct(quetion: "Delhi is capital of India", answer: "True"),
        QuizStruct(quetion: "Four - Two is equal to Two", answer: "True"),
        QuizStruct(quetion: "Biro Brothers invented the Ball Point Pen", answer: "True"),
        QuizStruct(quetion: "Television was invented by John Napier", answer: "False"),
        QuizStruct(quetion: "India is the largest tea exporter of the world", answer: "False")
    ]
    
    var result = 0
    var currentQuetioNumber = 0
    var quizzProgress : Float = 1
    
    mutating func checkAnswer(_ answer : String) {
        if answer == quiz[currentQuetioNumber].answer {
            result+=1
        }
        
        if currentQuetioNumber+1 < quiz.count {
            currentQuetioNumber+=1
        }
    }
    
    mutating func isQuizDone () -> Bool {
        if currentQuetioNumber+1 < quiz.count {
            return false
        } else {
            currentQuetioNumber = 0
            return true
        }
    }
    
    func quizProgress() -> Float {
        return Float(currentQuetioNumber+1) / Float(quiz.count)
    }
    
    func getNewQusttion()  -> String {
        return quiz[currentQuetioNumber].quetion
    }

}

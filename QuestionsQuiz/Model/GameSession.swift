//
//  GameSession.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import Foundation



class GameSession {
    
    var questionsArray:[Question]?
    var question: Question?
    
    var totalQuestions: Int = 10
    var numberOfQuestion: Int = 0
    var questionsAnswered: Int = 0
    var questionsAnsweredRight: Int?
    
    var totalMoneyEarned: Int?
    var helpersAvailable = [
        "callToFriend": 1,
        "helpFromSpectators": 1,
        "50Hint": 1
    ]
    var helpersUsed: Int?
//    var questionsOrder:
    
    init(){
       
    }
    
}

extension GameSession: GameViewControllerDelegate {
    
    func sendResult(questionsAnswered: Int, answeredWellQuestions: Int, moneyEarned: Int, helpers: [String:Int], helpersUsed: Int) {
        print("result sent to delegate")
        self.questionsAnswered = questionsAnswered
        self.questionsAnsweredRight = answeredWellQuestions
        self.totalMoneyEarned = moneyEarned
        self.helpersAvailable = helpers
        self.helpersUsed = helpersUsed
    
    }
    
    
}



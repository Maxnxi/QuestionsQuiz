//
//  GameSession.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import Foundation

class GameSession {
    
    var totalQuestions: Int = 10
    var questionsAnswered: Int = 0
    var questionsAnsweredRight: Int?
    
    var totalMoneyEarned: Int?
    var helpersAvailable = [
        "callToFriend": 1,
        "helpFromSpectators": 1,
        "50Hint": 1
    ]
    
}

extension GameSession: GameVCDelegate {
    func didTapAnswer(question: Question, answerInt: Int, helpersStatus: [String : Int]) {
        //TO do
        
    }
    
    
    
}

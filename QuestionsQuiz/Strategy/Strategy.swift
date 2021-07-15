//
//  Strategy.swift
//  QuestionsQuiz
//
//  Created by Maksim on 14.07.2021.
//

import Foundation

protocol CreateOrderOfQuestions {
    func createOrder(questions:[Question]) -> [Question]
}

final class RandomOrderQuestions: CreateOrderOfQuestions {
    
    func createOrder(questions: [Question]) -> [Question] {
        
        return questions.shuffled()
    }
    
    
}

final class StraightOrderQuestions: CreateOrderOfQuestions {
    
    func createOrder(questions: [Question]) -> [Question] {
        
        return questions
    }
    
    
}

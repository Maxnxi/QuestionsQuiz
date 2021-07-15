//
//  RandomOrderQuestions.swift
//  QuestionsQuiz
//
//  Created by Maksim on 15.07.2021.
//

import Foundation

final class RandomOrderQuestions: CreateOrderOfQuestions {
    
    func createOrder(questions: [Question]) -> [Question] {
        let shuffledQuestions = questions.shuffled()
        print("Shuffle", shuffledQuestions.first?.question)
        return shuffledQuestions
    }
    
    
}

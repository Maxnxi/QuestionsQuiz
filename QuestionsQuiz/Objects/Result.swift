//
//  Result.swift
//  QuestionsQuiz
//
//  Created by Maksim on 14.07.2021.
//

import Foundation

struct Result: Codable {
    let date: Date
    let answers: Int
    let answeredRight: Int
    let helpersUsed: Int
    let moneyEarned: Int
    
}

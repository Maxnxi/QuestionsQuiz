//
//  Game.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    weak var gameSession: GameSession?
    
    private init() {
        
    }
    
    
}

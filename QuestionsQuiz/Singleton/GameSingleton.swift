//
//  Game.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import Foundation

final class GameSingleton {
    
    static let shared = GameSingleton()
    
    private let resultsCareTaker = CareTaker()
    
    var gameSession: GameSession?
    
    var gameResults: [Result] {
        didSet {
            resultsCareTaker.saveResults(results: gameResults)
        }
    }
    
    private init() {
        gameResults = resultsCareTaker.loadResults() ?? []
    }
    
    func endGameCleanGameSession(){
        self.gameSession = nil
    }
    
    func mathsHowManyPercentsOfRightAnswers() {
        var resStat = 0.0
        gameResults.forEach { result in
            let stat = Double(result.answeredRight)/Double(result.answers)
            resStat += stat
        }
        let finStat = (resStat/Double(gameResults.count))*100
        print("Статистика правильных ответов: \(finStat) %" )
    }
    
    func addResultToArray(result:Result) {
        gameResults.append(result)
    }
    
    func clearResults() {
        gameResults.removeAll()
    }
    
}

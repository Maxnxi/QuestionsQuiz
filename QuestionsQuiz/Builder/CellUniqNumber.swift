//
//  CellUniqNumber.swift
//  QuestionsQuiz
//
//  Created by Maksim on 19.07.2021.
//

import Foundation

//защита, чтобы не перемещалась информация из разных ячеек

class CellUniqNumber {
    static let shared = CellUniqNumber()
    
    private var uniqCellNumbers: [Int] = []
    
    private init() {
        
    }
    
    func checkIsNumberUniq(number:Int) -> Bool {
        if uniqCellNumbers.contains(number) {
            return false
        } else {
            return true
        }
    }
    
    func addUniqNumber(number: Int) {
        uniqCellNumbers.append(number)
    }
    
    func clearArrayOfUniqNumbers() {
        uniqCellNumbers.removeAll()
    }
    
    func uniqCellNumbersArray() -> [Int] {
        return uniqCellNumbers
        
    }
    
    func removeLast() {
        uniqCellNumbers.removeLast()
    }
    
}

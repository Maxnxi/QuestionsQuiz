//
//  QuestionBuilder.swift
//  QuestionsQuiz
//
//  Created by Maksim on 17.07.2021.
//

import Foundation

//class QuestionBuilder {
//    private(set) var questionTxt:
//}

class QuestionBuilder {
    private(set) var questions: [Int:String] = [:]
    private(set) var rightAnswers: [Int:String] = [:]
    private(set) var wrongAnswers1: [Int:String] = [:]
    private(set) var wrongAnswers2: [Int:String] = [:]
    private(set) var wrongAnswers3: [Int:String] = [:]
    
    
    func build() -> [Question] {
        
        var questionsTmpArray: [Question] = []
        
        let questionsNumberArray = CellUniqNumber.shared.uniqCellNumbersArray()
        if questionsNumberArray.count == questions.count {
            
            for index in questionsNumberArray {
                guard let question = questions[index],
                let rightAnswer = rightAnswers[index],
                let wrongAnswer1 = wrongAnswers1[index],
                let wrongAnswer2 = wrongAnswers2[index],
                let wrongAnswer3 = wrongAnswers3[index] else {
                    print("fail in guard - Error #112")
                    return []
                }
                
                let answersArray = [rightAnswer, wrongAnswer1, wrongAnswer2, wrongAnswer3].shuffled()
                guard let rightIndex = answersArray.firstIndex(of: rightAnswer) else { return [] }
//                let rightInt = rightIndex?.hashValue
                
                let questionFinal = Question(question: question, allAnswers: answersArray, rightAnswer: rightIndex)
                questionsTmpArray.append(questionFinal)
            }
            
            
        } else {
            print("Error in QuestionsBuilder ")
        }
        
        
        
        
        return questionsTmpArray
    }
    
    func setQuestion(cellUniqNumber: Int, question: String) {
        self.questions[cellUniqNumber] = question
    }
    
    func setRightAnswer(cellUniqNumber: Int, answer: String) {
        self.rightAnswers[cellUniqNumber] = answer
    }
    
    func setWrongAnswer1(cellUniqNumber: Int, answer: String) {
        self.wrongAnswers1[cellUniqNumber] = answer
    }
    
    func setWrongAnswer2(cellUniqNumber: Int, answer: String) {
        self.wrongAnswers2[cellUniqNumber] = answer
    }
    
    func setWrongAnswer3(cellUniqNumber: Int, answer: String) {
        self.wrongAnswers3[cellUniqNumber] = answer
    }
    
}



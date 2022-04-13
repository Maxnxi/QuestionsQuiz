//
//  Question.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import Foundation

struct Question {
    
    var question: String
    var allAnswers: [String]
    var rightAnswer: Int
    
    func helper50Hint(question: Question) {
        
    }
    
    func helperFriendCall(question: Question) {
        
    }
}

let question1 = Question(question: "Кто главный герой в мультики «Гравити Фолз»?", allAnswers: ["Мейбл, Дипер","Дядя стен","Малыш Гедеон","Кенди, Гренда"] , rightAnswer: 1)
let question2 = Question(question: "Сколько пупырок в большом симпле дипле?", allAnswers: ["2","1","5","3"] , rightAnswer: 3)

let question3 = Question(question: "Как зовут кота из мультика «Простоквашино»?", allAnswers: ["Котофей","Мурсик","Матроскин","Пушок"] , rightAnswer: 3)
let question4 = Question(question: "Какая форма pop-it встречается реже других?", allAnswers: ["Круг","Ромб","Осьминог","Треугольник"] , rightAnswer: 3)

let question5 = Question(question: "Кто такая Звёздочка из мультика «Звёздочка Баттерфляй»", allAnswers: ["Принцесса","Злодейка","Звёздная Принцесса","Обычная девочка"] , rightAnswer: 3)
let question6 = Question(question: "Какого цвета пластмассовая основа симпла дипла?", allAnswers: ["розовый","белый","зелёный","красный"] , rightAnswer: 2)

let question7 = Question(question: "Какого цвета Доберман?", allAnswers: ["розовый","черный","белый","кремовый"] , rightAnswer: 2)
let question8 = Question(question: "Шпиц он какой?", allAnswers: ["лысый","с короткой шерстью","пушистый","огромный комок шерсти"] , rightAnswer: 3)

let question9 = Question(question: "Что означает слово clover?", allAnswers: ["умный","вид цветка","везучий","красивый"] , rightAnswer: 2)
let question10 = Question(question: "Сколько пупырок в среднем сипле дипле?", allAnswers: ["1","4","2","3"] , rightAnswer: 2)

let QUESTIONS_ARRAY = [question1,question2,question3,question4,question5,question6,question7,question8,question9,question10]

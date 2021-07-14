//
//  GameViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import UIKit

enum ForAlertView {
    case rightAnswer
    case wrongAnswer
    case gameOver
}

protocol GameVCDelegate: class {
    func didTapAnswer(question: Question, answerInt: Int, helpersStatus: [String:Int] )
    
}

class GameViewController: UIViewController {

    @IBOutlet weak var numberOfQuestionsLbl: UILabel!
    @IBOutlet weak var answeredWellQuestionsLbl: UILabel!
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerOneBtn: UIButton!
    @IBOutlet weak var answerTwoBtn: UIButton!
    @IBOutlet weak var answerThreeBtn: UIButton!
    @IBOutlet weak var answerFourBtn: UIButton!
    
    @IBOutlet weak var helper50HintBtn: UIButton!
    @IBOutlet weak var helperFromSpactatorsBtn: UIButton!
    @IBOutlet weak var helperCallToFriendBtn: UIButton!
    
    weak var gameDelegate: GameVCDelegate?
    
    var numberOfQuestion: Int = 0
    var questionsArray:[Question]?
    var question: Question?
    
    var helpers: [String: Int] = [
        "callToFriend": 1,
        "helpFromSpectators": 1,
        "50Hint": 1
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionsArray = QUESTIONS_ARRAY
        print("questions loaded")
        setQuestion(numberOfQuestion: numberOfQuestion)

    }
    
    func setQuestion(numberOfQuestion: Int) {
        guard let quest = questionsArray?[numberOfQuestion],
              let count = questionsArray?.count else { return }
        
        self.question = quest
        
        self.numberOfQuestionsLbl.text = "Вопрос: \(numberOfQuestion + 1 ) из \(count)"
        
        //to do
        self.answeredWellQuestionsLbl.text = "Отвечено верно: 0 %"
        
        self.questionLbl.text = quest.question
        self.answerOneBtn.setTitle(quest.allAnswers[0], for: .normal)
        self.answerTwoBtn.setTitle(quest.allAnswers[1], for: .normal)
        self.answerThreeBtn.setTitle(quest.allAnswers[2], for: .normal)
        self.answerFourBtn.setTitle(quest.allAnswers[3], for: .normal)
        checkAndSetHelpers()
        
    }
    
    func checkAndSetHelpers(){
        if helpers["50Hint"] == 1 {
            helper50HintBtn.isEnabled = true
            helper50HintBtn.isHidden = false
        } else {
            helper50HintBtn.isEnabled = false
            helper50HintBtn.isHidden = true
        }
        if helpers["helpFromSpectators"] == 1 {
            helperFromSpactatorsBtn.isEnabled = true
            helperFromSpactatorsBtn.isHidden = false
        } else {
            helperFromSpactatorsBtn.isEnabled = false
            helperFromSpactatorsBtn.isHidden = true
        }
        if helpers["callToFriend"] == 1 {
            helperFromSpactatorsBtn.isEnabled = true
            helperFromSpactatorsBtn.isHidden = false
        } else {
            helperFromSpactatorsBtn.isEnabled = false
            helperFromSpactatorsBtn.isHidden = true
        }
    }
    
    
    func answerTapped(numberOfAnswer: Int) {
        guard let questi = question else {
            print("error #10")
            return
        }
        gameDelegate?.didTapAnswer(question: questi, answerInt: numberOfAnswer, helpersStatus: helpers)
        checkAnswerCorrect(question: questi, numberOfAnswer: numberOfAnswer)
        if numberOfQuestion < 9 {
           
            numberOfQuestion += 1
            print("numberOfQuestion", numberOfQuestion)
            setQuestion(numberOfQuestion: numberOfQuestion)
            
        } else if numberOfQuestion == 9 {
           
            createAlertView(kindOfView: .gameOver)

        }
        
    }
    
    func checkAnswerCorrect(question: Question, numberOfAnswer: Int) {
        if numberOfAnswer == question.rightAnswer {
            createAlertView(kindOfView: .rightAnswer)
        } else {
            createAlertView(kindOfView: .wrongAnswer)
        }
    }
    
    func createAlertView(kindOfView: ForAlertView) {
        var messageLabel = ""
        
        switch kindOfView {
        case .rightAnswer:
            messageLabel = "Правильный ответ!"
        case .wrongAnswer:
            messageLabel = "Ответ не верный!"
        case .gameOver:
            messageLabel = "Конец Игры!"
            
        }
        let alertView = UIAlertController.init(title: "Внимание!", message: messageLabel, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if self.numberOfQuestion == 9 {
                if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainMenuViewController") as? MainMenuViewController {
                    view.modalPresentationStyle = .fullScreen
                    self.present(view, animated: true, completion: nil)
                }
            }
        })
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
    }

    @IBAction func answerOneBtnWasPrssd(_ sender: Any) {
        answerTapped(numberOfAnswer: 1)
    }
    
    @IBAction func answerTwoBtnWasPrssd(_ sender: Any) {
        answerTapped(numberOfAnswer: 2)
    }
    
    @IBAction func answerThreeBtnWasPrssd(_ sender: Any) {
        answerTapped(numberOfAnswer: 3)
    }
    
    @IBAction func answerFourBtnWasPrssd(_ sender: Any) {
        answerTapped(numberOfAnswer: 4)
    }
    
    
}


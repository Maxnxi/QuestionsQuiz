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
    case friendCall
    case helpOfSpectators
    case hint50
}

protocol GameViewControllerDelegate: AnyObject {
    func sendResult(questionsAnswered: Int, answeredWellQuestions: Int, moneyEarned: Int, helpers: [String:Int], helpersUsed: Int)
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
    
    @IBOutlet weak var moneyEarnedLbl: UILabel!
    
    //ДЗ №1 п.4 delegate
    weak var gameViewControllerDelegate: GameViewControllerDelegate?
    
    var questionsArray:[Question]?
    var question: Question?
    
    var totalQuestions: Int = 10
    var numberOfQuestion: Int = 0
    var answeredWellQuestions: Int = 0
    var questionsAnswered: Int = 0
    
    var moneyEarned: Int = 0
    var helpers: [String: Int] = [
        "callToFriend": 1,
        "helpFromSpectators": 1,
        "50Hint": 1
    ]
    var helpersUsed: Int = 0
    
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
        self.moneyEarnedLbl.text = "Заработано денег: \(moneyEarned) Bitcoins"
        //настройка - проверка кнопок
        self.answerOneBtn.isHidden = false
        self.answerTwoBtn.isHidden = false
        self.answerThreeBtn.isHidden = false
        self.answerFourBtn.isHidden = false
        
        self.answerOneBtn.setTitle(quest.allAnswers[0], for: .normal)
        self.answerTwoBtn.setTitle(quest.allAnswers[1], for: .normal)
        self.answerThreeBtn.setTitle(quest.allAnswers[2], for: .normal)
        self.answerFourBtn.setTitle(quest.allAnswers[3], for: .normal)
        checkAndSetHelpers()
        
    }
    
    func checkAndSetHelpers(){
        if helpers["50Hint"] == 1 {
            helper50HintBtn.isHidden = false
        } else {
            helper50HintBtn.isHidden = true
        }
        if helpers["helpFromSpectators"] == 1 {
            helperFromSpactatorsBtn.isHidden = false
        } else {
            helperFromSpactatorsBtn.isHidden = true
        }
        if helpers["callToFriend"] == 1 {
            helperFromSpactatorsBtn.isHidden = false
        } else {
            helperFromSpactatorsBtn.isHidden = true
        }
    }
    
    
    func answerTapped(numberOfAnswer: Int) {
        questionsAnswered += 1
        guard let questi = question else {
            print("error #10")
            return
        }
        
        checkAnswerCorrect(question: questi, numberOfAnswer: numberOfAnswer)
        if numberOfQuestion < 9 {
           
            numberOfQuestion += 1
            print("numberOfQuestion", numberOfQuestion)
            setQuestion(numberOfQuestion: numberOfQuestion)
            
        } else if numberOfQuestion == 9 {
            print("=========")
            print("Game over")
            //createAlertView(kindOfView: .gameOver)
            self.dismiss(animated: true) {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        gameViewControllerDelegate?.sendResult(questionsAnswered: questionsAnswered, answeredWellQuestions: answeredWellQuestions, moneyEarned: moneyEarned, helpers: helpers, helpersUsed: helpersUsed)
        
    }
    
    func checkAnswerCorrect(question: Question, numberOfAnswer: Int) {
        if numberOfAnswer == question.rightAnswer {
            createAlertView(kindOfView: .rightAnswer)
            self.moneyEarned += 100
            self.answeredWellQuestions += 1
        } else {
            createAlertView(kindOfView: .wrongAnswer)
            self.moneyEarned -= 100
        }
    }
    
    func createAlertView(kindOfView: ForAlertView) {
        var messageLabel = ""
        var titleLbl = "Внимание!"
        switch kindOfView {
        case .rightAnswer:
            messageLabel = "Правильный ответ!"
        case .wrongAnswer:
            messageLabel = "Ответ не верный!"
        case .gameOver:
            messageLabel = "Конец Игры!"
        case .friendCall:
            let answer = getRightAnswer()
            titleLbl = "Ало, ало!"
            messageLabel = "Я думаю правильный ответ - \(answer). "
        case .helpOfSpectators:
            let answer1 = getRightAnswer()
            let answer2 = getRandomAnswerNotRight()
            titleLbl = "Зал проголосовал!"
            messageLabel = "Зал считает 90% - \(answer1), 10% - \(answer2)"
        case .hint50:
            titleLbl = "Помощь компьютера!"
            messageLabel = "Убрано два неправильных варианта!"
        }
        let alertView = UIAlertController.init(title: titleLbl, message: messageLabel, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { action in
            if kindOfView == .gameOver{
                self.dismiss(animated: true) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        })
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
    }
    
    func getRightAnswer() -> String {
        guard let answerNumber = question?.rightAnswer,
              let answer = question?.allAnswers[answerNumber-1] else {return "нет ответа" }
        return answer
    }
    
    func getRandomAnswerNotRight() -> String {
        guard let answerNumber = question?.rightAnswer else { return "нет ответа" }
        var value = 0
        repeat{
            value = Int.random(in: 0...3)
        } while (value == (answerNumber-1))
        guard let answer = question?.allAnswers[value] else {return "нет ответа"}
        return answer
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
    
    @IBAction func helper50HintWasPrssd(_ sender: Any) {
        createAlertView(kindOfView: .hint50)
        self.helpers["50Hint"] = 0
        self.helpersUsed += 1
        guard let answerNumber = question?.rightAnswer else { return }
        for _ in 0..<2 {
            var rndNumberOfBtnToDismiss = 0
            repeat{
                rndNumberOfBtnToDismiss = Int.random(in: 0...3)
            } while (rndNumberOfBtnToDismiss == answerNumber-1)
            
            switch rndNumberOfBtnToDismiss {
            case 0:
                self.answerOneBtn.isHidden = true
            case 1:
                self.answerTwoBtn.isHidden = true
            case 2:
                self.answerThreeBtn.isHidden = true
            case 3:
                self.answerFourBtn.isHidden = true
            default:
                print("helper50HintWasPrssd - case -default")
            }
        }
        self.helper50HintBtn.isHidden = true
    }
    
    @IBAction func helperFromSpectatorsWasPrssd(_ sender: Any) {
        createAlertView(kindOfView: .helpOfSpectators)
        self.helpers["helpFromSpectators"] = 0
        self.helpersUsed += 1
        self.helperFromSpactatorsBtn.isHidden = true
    }
    @IBAction func helperCallToFriendWasPrssd(_ sender: Any) {
        createAlertView(kindOfView: .friendCall)
        self.helpers["callToFriend"] = 0
        self.helpersUsed += 1
        self.helperCallToFriendBtn.isHidden = true
    }
    
    
    @IBAction func takeMoneyAndQuitBtnWasPrssd(_ sender: Any) {
        createAlertView(kindOfView: .gameOver)
        //to do
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      let result = Result(date: Date(), answers: questionsAnswered, answeredRight: answeredWellQuestions, helpersUsed: helpersUsed, moneyEarned: moneyEarned)
        GameSingleton.shared.addResultToArray(result: result)
        GameSingleton.shared.mathsHowManyPercentsOfRightAnswers()
        GameSingleton.shared.endGameCleanGameSession()
    }
    
}


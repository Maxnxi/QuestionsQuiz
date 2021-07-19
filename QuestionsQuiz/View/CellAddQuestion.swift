//
//  CellAddQuestion.swift
//  QuestionsQuiz
//
//  Created by Maksim on 17.07.2021.
//

import UIKit

class CellAddQuestion: UITableViewCell {

    @IBOutlet weak var questionTxtView: UITextView! {
        didSet {
            print("didSet questions - done")
            question = questionTxtView.text
        }
    }
    
    @IBOutlet weak var rightAnswerTxtField: UITextField!{
        didSet {
            rightAnswer = rightAnswerTxtField.text
        }
    }
    
    @IBOutlet weak var wrongAnswer1TxtField: UITextField! {
        didSet {
            wrongAnswer1 = wrongAnswer1TxtField.text
        }
    }
    
    @IBOutlet weak var wrongAnswer2TxtField: UITextField! {
        didSet {
            wrongAnswer2 = wrongAnswer2TxtField.text
        }
    }
    
    @IBOutlet weak var wrongAnswer3TxtField: UITextField! {
        didSet {
            wrongAnswer3 = wrongAnswer3TxtField.text
        }
    }
    
    var builder: QuestionBuilder?
    
    private var randomNumOfCell: Int = 0
    
    var question2: String {
        //var qst = ""
        return questionTxtView.text
        //return qst
    }
    
    private var question: String? {
        didSet {
            guard let questiTmp = question,
                  questiTmp != "" else {return}
            builder?.setQuestion(cellUniqNumber: randomNumOfCell, question: questiTmp)
        }
    }
    
    private var rightAnswer: String? {
        didSet {
            guard let rightAnswerTmp = rightAnswer,
                  rightAnswerTmp != "" else {return}
            builder?.setRightAnswer(cellUniqNumber: randomNumOfCell, answer: rightAnswerTmp)
        }
    }
    
    private var wrongAnswer1: String? {
        didSet {
            guard let wrongAnswer1Tmp = wrongAnswer1,
                  wrongAnswer1Tmp != "" else {return}
            builder?.setWrongAnswer1(cellUniqNumber: randomNumOfCell, answer: wrongAnswer1Tmp)
        }
    }
    
    private var wrongAnswer2: String? {
        didSet {
            guard let wrongAnswer2Tmp = wrongAnswer2,
                  wrongAnswer2Tmp != "" else {return}
            builder?.setWrongAnswer2(cellUniqNumber: randomNumOfCell, answer: wrongAnswer2Tmp)
        }
    }
    
    private var wrongAnswer3: String? {
        didSet {
            guard let wrongAnswer3Tmp = wrongAnswer3,
                  wrongAnswer3Tmp != "" else {return}
            builder?.setWrongAnswer3(cellUniqNumber: randomNumOfCell, answer: wrongAnswer3Tmp)
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellNum()
    
        
    }
    
    init(){
        super.init(style: .default, reuseIdentifier: "cellAddQuestion")
        //cellNum()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //cellNum()
    }
    
    func cellNum(){
        print(#function)
        var randomTmpCellNumber: Int = 0
        
        repeat {
            randomTmpCellNumber = Int.random(in: 0...50)
        } while (CellUniqNumber.shared.checkIsNumberUniq(number: randomTmpCellNumber) == false)
        print("randomTmpCellNumber is -", randomTmpCellNumber)
        CellUniqNumber.shared.addUniqNumber(number: randomTmpCellNumber)
        self.randomNumOfCell = randomTmpCellNumber
            
    }
    
    
    

}

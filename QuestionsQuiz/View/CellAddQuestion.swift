//
//  CellAddQuestion.swift
//  QuestionsQuiz
//
//  Created by Maksim on 17.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

class CellAddQuestion: UITableViewCell {
    
    private let disposeBag = DisposeBag()
    

    @IBOutlet weak var questionTxtView: UITextView!
    @IBOutlet weak var rightAnswerTxtField: UITextField!
    @IBOutlet weak var wrongAnswer1TxtField: UITextField!
    @IBOutlet weak var wrongAnswer2TxtField: UITextField!
    @IBOutlet weak var wrongAnswer3TxtField: UITextField!
    
    var builder: QuestionBuilder?
    
    private var randomNumOfCell: Int = 0
    private var question: String?
    private var rightAnswer: String?
    private var wrongAnswer1: String?
    private var wrongAnswer2: String?
    private var wrongAnswer3: String?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellNum()
        
        self.questionTxtView.rx.text
            .orEmpty
            .asObservable()
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
            .skip(1)
            .distinctUntilChanged()
            .subscribe { [unowned self] event in
            self.builder?.setQuestion(cellUniqNumber: randomNumOfCell, question: event ?? "")
        }.disposed(by: disposeBag)
        
        self.rightAnswerTxtField.rx.text
            .orEmpty
            .asObservable()
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
            .skip(1)
            .distinctUntilChanged()
            .subscribe (onNext: { [unowned self] event in
            builder?.setRightAnswer(cellUniqNumber: randomNumOfCell, answer: event ?? "")
        }).disposed(by: disposeBag)
        
        self.wrongAnswer1TxtField.rx.text
            .orEmpty
            .asObservable()
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
            .skip(1)
            .distinctUntilChanged()
            .subscribe { [unowned self] event in
            builder?.setWrongAnswer1(cellUniqNumber: randomNumOfCell, answer: event ?? "")
        }
        self.wrongAnswer2TxtField.rx.text
            .orEmpty
            .asObservable()
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
            .skip(1)
            .distinctUntilChanged()
            .subscribe { [unowned self] event in
            builder?.setWrongAnswer2(cellUniqNumber: randomNumOfCell, answer: event ?? "")
        }
        self.wrongAnswer3TxtField.rx.text
            .orEmpty
            .asObservable()
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
            .skip(1)
            .distinctUntilChanged()
            .subscribe { [unowned self] event in
            builder?.setWrongAnswer3(cellUniqNumber: randomNumOfCell, answer: event ?? "")
        }


        
        
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

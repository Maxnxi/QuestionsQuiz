//
//  MainMenuViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
//    @IBOutlet weak var settingsBtn: UIButton!
//    @IBOutlet weak var addQuestionBtn: UIButton!
//    @IBOutlet weak var resultsBtn: UIButton!
    
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var addQuestionBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    
    //ДЗ№2 Strategy
    var questionsOrder: QuestionsOrder?{
        didSet{
            
        }
    } // по умолчанию straight
    
     var questionsOrderStrategy: CreateOrderOfQuestions {
        switch self.questionsOrder {
        case .straight:
            print("straight")
            return StraightOrderQuestions()
        case .random:
            print("random")
            return RandomOrderQuestions()
        case .none:
            print("Smth go wrong Error #312")
            return StraightOrderQuestions()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.questionsOrder = GameSingleton.shared.questionsOrder
        print("questionsOrder is ", questionsOrder)
        
    }
    
    
//    func questionsOrderStrategyFunc(questionsOrdr: QuestionsOrder ) -> CreateOrderOfQuestions {
//        switch questionsOrdr {
//        case .straight:
//            print("straight")
//            return StraightOrderQuestions()
//        case .random:
//            print("random")
//            return RandomOrderQuestions()
////        case .none:
////            print("Smth go wrong Error #312")
////            return StraightOrderQuestions()
//        }
//    }
    

    @IBAction func playBtnWasPrssd(_ sender: Any) {
        //ДЗ№2 Strategy
        
        
        
        //ДЗ №1 п.4
        //создавайте новый GameSession и передайте его синглтону Game
        //let questionsOrder = questionsOrder
        let gmeSession = GameSession(orderQuestions: questionsOrderStrategy)
        GameSingleton.shared.gameSession = gmeSession

        
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameViewController") as? GameViewController {
            
            //подписываем делегат
            view.gameViewControllerDelegate = gmeSession
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func settingsBtnWasPrssd(_ sender: Any) {
        let view = SettingsViewController()
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }

    @IBAction func addQuestionBtnWasPrssd(_ sender: Any) {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addQuestionViewController") as? AddQuestionViewController {
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
    }

    @IBAction func resultsBtnWasPrssd(_ sender: Any) {
        //        let view = ResultsViewController()
        //        view.modalPresentationStyle = .fullScreen
        //        present(view, animated: true, completion: nil)
    }
    
}


//
//  MainMenuViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var addQuestionBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func playBtnWasPrssd(_ sender: Any) {
        //ДЗ №1 п.4
        //создавайте новый GameSession и передайте его синглтону Game
        let gmeSession = GameSession()
        Game.shared.gameSession = gmeSession
        
        //переход
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameViewController") as? GameViewController {
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func addQuestionBtnWasPrssd(_ sender: Any) {
    }
    
    @IBAction func settingsBtnWasPrssd(_ sender: Any) {
    }
    
    @IBAction func resultsBtnWasPrssd(_ sender: Any) {
        
        let view = ResultsViewController()
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
    }
    
}


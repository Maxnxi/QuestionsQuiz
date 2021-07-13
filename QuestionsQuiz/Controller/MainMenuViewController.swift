//
//  MainMenuViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 13.07.2021.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func playBtnWasPrssd(_ sender: Any) {
        let view = GameViewController()
        view.modalPresentationStyle = .fullScreen
        view.present(view, animated: true, completion: nil)
    }
    
    @IBAction func resultsBtnWasPrssd(_ sender: Any) {
        let view = ResultsViewController()
        view.modalPresentationStyle = .fullScreen
        view.present(view, animated: true, completion: nil)
    }
    
}


//
//  AddQuestionViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 16.07.2021.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addOneMoreQuestionCellBtn: UIButton!
    @IBOutlet weak var deleteQuestionBtn: UIButton!
    
    var questionsCell: Int = 1 {
        didSet {
            tableView.reloadData()
        }
    }
    var questionsArray: [Question] = []
    var cellsArray: [UITableViewCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.deleteQuestionBtn.isHidden = true
        // Do any additional setup after loading the view.
        
//        NotificationCenter.default.addObserver(self, selector: #selector(onDidRecievedData(_:)), name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }
    
//    @objc func onDidRecievedData(_ notification: Notification) {
//        if let data = notification.userInfo
//    }
    
    @IBAction func addOneMoreQuestionCellBtnWasPrssd(_ sender: Any) {
        questionsCell += 1
        deleteQuestionBtn.isHidden = false
    }
    
    @IBAction func deleteQuestionBtnWasPrssd(_ sender: Any) {
        if questionsCell > 2 {
            questionsCell -= 1
        } else if questionsCell == 2  {
            questionsCell -= 1
            deleteQuestionBtn.isHidden = true
        }
    }
    
    @IBAction func addQuestionsToBaseBtnWasPrssd(_ sender: Any) {
        let numberOfRows = tableView(tableView, numberOfRowsInSection: 0)
        if numberOfRows == questionsCell {
            print("numberOfRows == questionsCell")
        }
        print("cells Array count - is - ", cellsArray.count)
        
        
        
        QuestionStorage.shared.addQuestionToArray(questions: self.questionsArray)
        print("Added questions")
        dismiss(animated: true, completion: nil)
        //TO do alert view
    }
    
    @IBAction func backBtnWasPrssd(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellAddQuestion") as? CellAddQuestion {
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}



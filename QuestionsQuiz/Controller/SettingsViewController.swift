//
//  SettingsViewController.swift
//  QuestionsQuiz
//
//  Created by Maksim on 15.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var backBtn: UIButton?
//    var labelSettings: UILabel?
    var labelForOrder: UILabel?
    var segmentedControlForOrder: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backBtn = createBackBtn()
        self.labelForOrder = createOrderLabel()
        self.segmentedControlForOrder = createSegmentControlToChooseOrder()

        view.backgroundColor = #colorLiteral(red: 0.3333012462, green: 0.3333538771, blue: 0.3332896829, alpha: 1)
        
    }
    
    func createOrderLabel() -> UILabel {
        let rect = CGRect(x: 0, y: 0, width: 40, height: 24)
        let label = UILabel(frame: rect)
        label.font = UIFont(name: "Avenir next", size: 16)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "Настройка порядка вопросов:"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        guard let bckTmpBtn = backBtn else { return UILabel() }
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        return label
    }
    
    func createSegmentControlToChooseOrder() -> UISegmentedControl {
        
        let items = ["Прямой порядок","Случайный порядок"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        
        customSC.layer.cornerRadius = 5
        customSC.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        customSC.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        customSC.selectedSegmentTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //customSC.setTitleTextAttributes([NSAttributedString.Key : Any]?, for: .normal)
        
        customSC.addTarget(self, action: #selector(changeOrder(sender:)), for: .valueChanged)
        
        view.addSubview(customSC)
        
        customSC.translatesAutoresizingMaskIntoConstraints = false
        guard let lblTmpForOrder = labelForOrder else { return UISegmentedControl() }
        NSLayoutConstraint.activate([
            customSC.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            customSC.topAnchor.constraint(equalTo: view.topAnchor, constant: 140)
        ])
        
        return customSC
    }
    
    @objc func changeOrder(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            print("random order set!")
            GameSingleton.shared.questionsOrder = .random
        default:
            
            print("straight order set!")
            GameSingleton.shared.questionsOrder = .straight
        }
    }
    
    func createBackBtn() -> UIButton {
        
        let rectForBackBtn = CGRect(x: 0, y: 0, width: 30, height: 24)
        let backBtn = UIButton(frame: rectForBackBtn)
        backBtn.setTitle(" Back", for: .normal)
        backBtn.setTitleColor(#colorLiteral(red: 0.02848022804, green: 0.9333859086, blue: 0.9410562515, alpha: 1), for: .normal)
        let backImage = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        //let renderedImage = backImage.colo
        backBtn.setImage(backImage, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.02848022804, green: 0.9333859086, blue: 0.9410562515, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnBackBtn(_:)))
        backBtn.addGestureRecognizer(tap)
        
        view.addSubview(backBtn)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        return backBtn
    }
    
    @objc func didTapOnBackBtn(_ sender: UITapGestureRecognizer) {
        print("back Btn tapped")
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  TASK-Lectures
//
//  Created by Tomislav Gelesic on 15/10/2020.
//

import UIKit

class InputViewController: UIViewController {
    
    //MARK:Properties
    
    let timePicker = UIDatePicker()
    
    let shortBreakLabel: UILabel = {
        let label = UILabel ()
        let attrString = NSMutableAttributedString(string: "Duration of short brake (in minutes)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.47, blue: 0.85, alpha: 0.6)])
        label.attributedText = attrString
        label.font.withSize(10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shortBreakTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.3)
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let largeBreakLabel: UILabel = {
        let label = UILabel ()
        let attrString = NSMutableAttributedString(string: "Duration of large brake (in minutes)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.47, blue: 0.85, alpha: 0.6)])
        label.attributedText = attrString
        label.font.withSize(10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let largeBreakTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.3)
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let gradeBeforeBreakLabel: UILabel = {
        let label = UILabel ()
        let attrString = NSMutableAttributedString(string: "After which grade is a large break", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.47, blue: 0.85, alpha: 0.6)])
        label.attributedText = attrString
        label.font.withSize(10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gradeBeforeBreakTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.3)
        textField.placeholder = "Enter number"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let desiredTimeLabel: UILabel = {
        let label = UILabel ()
        let attrString = NSMutableAttributedString(string: "Desired time", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.47, blue: 0.85, alpha: 0.6)])
        label.attributedText = attrString
        label.font.withSize(10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let desiredTimeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.3)
        textField.placeholder = "Enter the desired time"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let findOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("FIND OUT", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationItem.title = "Lectures"
        
        view.addSubview(shortBreakLabel)
        view.addSubview(shortBreakTextField)
        view.addSubview(largeBreakLabel)
        view.addSubview(largeBreakTextField)
        view.addSubview(gradeBeforeBreakLabel)
        view.addSubview(gradeBeforeBreakTextField)
        view.addSubview(desiredTimeLabel)
        view.addSubview(desiredTimeTextField)
        
        timePicker.isUserInteractionEnabled = true
        timePicker.datePickerMode = .time
        
        desiredTimeTextField.inputView = timePicker
        
        view.addSubview(findOutButton)
        findOutButton.addTarget(self, action: #selector(findOutButtonTapped), for: .touchUpInside)
        findOutButton.layer.cornerRadius = 20
        findOutButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        setConstraints()
    }
    
    
    //MARK: Functions
    
    @objc func findOutButtonTapped () {
        
        let shortBreakDuration = Int(shortBreakTextField.text ?? "") ?? 0
        let largeBreakDuration = Int(largeBreakTextField.text ?? "") ?? 0
        let gradeBeforeLargeBreak = Int(gradeBeforeBreakTextField.text ?? "" ) ?? 0
        let components = Calendar.current.dateComponents([.hour, .minute], from: timePicker.date)
        let wantedMin:Int = components.minute! + (components.hour! - 8) * 60
        let gradeDuration:Int = 45
        var currMin: Int = 0
        var gradeCnt: Int = 0
        var resultText: String = ""
        
        if shortBreakTextField.text == "" || largeBreakTextField.text == "" || gradeBeforeBreakTextField.text == "" || desiredTimeTextField.text == "" {
            resultText = "Invalid input!"
        } else {
            if components.hour! >= 15 {
                resultText = "No more lectures today!"
            } else if components.hour! < 8{
                resultText = "Lectures haven´t started yet!"
            } else {
                while currMin < 420 {
                    currMin += gradeDuration
                    gradeCnt += 1
                    if currMin > wantedMin{
                        var sufix = ""
                        switch gradeCnt {
                        case 1:
                            sufix = "st"
                        case 2:
                            sufix = "nd"
                        case 3:
                            sufix = "rd"
                        default:
                            sufix = "th"
                        }
                        resultText = "The \(gradeCnt)\(sufix) grade is in progress"
                        break
                    }
                    if gradeCnt == gradeBeforeLargeBreak {
                        currMin += largeBreakDuration
                        if currMin > wantedMin{
                            resultText = "The large break is in progress"
                            break
                        }
                    } else {
                        currMin += shortBreakDuration
                        if currMin > wantedMin{
                            resultText = "The short break grade is in progress"
                            break
                        }
                    }
                }
            }
        }
        
        let resultViewController = ResultViewController()
        resultViewController.parentImage.image = self.navigationController?.view.asImage()
        
        let attrString = NSMutableAttributedString(string: resultText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.47, blue: 0.85, alpha: 0.6)])
        
        resultViewController.resultLabel.attributedText = attrString
        
        resultViewController.modalPresentationStyle = .fullScreen
        self.present(resultViewController, animated: false, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: timePicker.date)
        
        desiredTimeTextField.text = String("\(components.hour!) : \(components.minute!)")
        
        shortBreakTextField.resignFirstResponder()
        largeBreakTextField.resignFirstResponder()
        gradeBeforeBreakTextField.resignFirstResponder()
        desiredTimeTextField.resignFirstResponder()
        
    }
    
    
    //MARK: Constraints
    func setConstraints() {
        
        shortBreakLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        shortBreakLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        shortBreakLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shortBreakLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        shortBreakTextField.topAnchor.constraint(equalTo: shortBreakLabel.bottomAnchor, constant: 5)
            .isActive = true
        shortBreakTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        shortBreakTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        shortBreakTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        largeBreakLabel.topAnchor.constraint(equalTo: shortBreakTextField.bottomAnchor, constant: 20).isActive = true
        largeBreakLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        largeBreakLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        largeBreakLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        largeBreakTextField.topAnchor.constraint(equalTo: largeBreakLabel.bottomAnchor, constant: 5)
            .isActive = true
        largeBreakTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        largeBreakTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        largeBreakTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        gradeBeforeBreakLabel.topAnchor.constraint(equalTo: largeBreakTextField.bottomAnchor,constant: 20).isActive = true
        gradeBeforeBreakLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        gradeBeforeBreakLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        gradeBeforeBreakLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        gradeBeforeBreakTextField.topAnchor.constraint(equalTo: gradeBeforeBreakLabel.bottomAnchor, constant: 5)
            .isActive = true
        gradeBeforeBreakTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        gradeBeforeBreakTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        gradeBeforeBreakTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        desiredTimeLabel.topAnchor.constraint(equalTo: gradeBeforeBreakTextField.bottomAnchor,constant: 20).isActive = true
        desiredTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        desiredTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        desiredTimeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        desiredTimeTextField.topAnchor.constraint(equalTo: desiredTimeLabel.bottomAnchor, constant: 5)
            .isActive = true
        desiredTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        desiredTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        desiredTimeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        findOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        findOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        findOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        findOutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
}




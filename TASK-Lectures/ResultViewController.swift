//
//  ResultViewController.swift
//  TASK-Lectures
//
//  Created by Tomislav Gelesic on 16/10/2020.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Properties
    let parentImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let exitButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    //MARK: init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(parentImage)
        parentImage.addSubview(dimmerView)
        dimmerView.addSubview(contentView)
        contentView.addSubview(resultLabel)
        contentView.addSubview(exitButton)
        
        exitButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        exitButton.isUserInteractionEnabled = true
        
        setConstraints()
    }
    //MARK: Functions
    
    @objc func exitButtonTapped () {
        print("\n\ntest\n\n")
        self.resignFirstResponder()
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: Constraints
    func setConstraints() {
        
        parentImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        parentImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        parentImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        parentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        dimmerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dimmerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dimmerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: dimmerView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: dimmerView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: dimmerView.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        
        resultLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        exitButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        exitButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
    }
    
}

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
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        contentView.backgroundColor = .white
        
        
        setConstraints()
    }
    //MARK: Functions
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
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignFirstResponder()
        dismiss(animated: false, completion: nil)
    }
    
    
}

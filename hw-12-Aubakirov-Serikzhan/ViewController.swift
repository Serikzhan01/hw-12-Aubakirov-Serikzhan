//
//  ViewController.swift
//  hw-12-Aubakirov-Serikzhan
//
//  Created by Serikzhan on 26.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .clear
        button.setTitleColor(.cyan, for: .normal)
        button.addTarget(self, action: #selector(playPauseButtonButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstaints()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: Setup
    func setupHierarchy() {
        view.addSubview(timerLabel)
        view.addSubview(playPauseButton)
    }

    func setupConstaints() {
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230),
            timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            playPauseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            playPauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            playPauseButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: Actions
    
    @objc private func playPauseButtonButtonPressed() {
        print("play pause button pressed")
    }

}


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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: Setup
    func setupHierarchy() {
        view.addSubview(timerLabel)
        
    }

    func setupConstaints() {
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230),
            timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
    }

}


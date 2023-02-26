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
        label.text = "\(workTime)"
        label.textColor = .red
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isWorkTime = true
    var isStarted = false
    
    var workTime = 25
    var restTime = 10
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "\(workTime):00"
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
    
    @objc private func playPauseButtonTapped(_ sender: UIButton) {
        if isStarted {
                  pauseTimer()
            playPauseButton.setTitle("Play", for: .normal)
              } else {
                  startTimer()
                  playPauseButton.setTitle("Pause", for: .normal)
              }
              isStarted = !isStarted
    }
    func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.timerFired()
            }
        }
        
        func pauseTimer() {
            timer?.invalidate()
            timer = nil
        }
        
        func timerFired() {
            if isWorkTime {
                workTime -= 1
                timerLabel.text = "\(workTime):00"
                timerLabel.textColor = .red
                playPauseButton.setTitleColor(.red, for: .normal)
                if workTime == 0 {
                    isWorkTime = false
                    restTime = 10
                }
            } else {
                restTime -= 1
                timerLabel.text = "\(restTime):00"
                timerLabel.textColor = .green
                playPauseButton.setTitleColor(.green, for: .normal)
                if restTime == 0 {
                    isWorkTime = true
                    workTime = 25
                }
            }
        }
}


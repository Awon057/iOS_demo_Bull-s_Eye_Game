//
//  ViewController.swift
//  BallsEye
//
//  Created by Dnet ITHelpdesk on 9/6/19.
//  Copyright © 2019 Dnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startNewRound()
    }
    
    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close"
        }
        
        score += points
        let message = "You scored \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
        action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        //startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
    }
    
    @IBAction func StartOverClicked(_ sender: UIButton) {
        round = 0
        score = 0
        startNewRound()
        
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        scoreLabel.text = String(score)
        targetValueLabel.text = String(targetValue)
        roundLabel.text = String(round)
    }
}


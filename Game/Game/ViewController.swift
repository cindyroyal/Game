//
//  ViewController.swift
//  Game
//
//  Created by Cindy Royal on 2/16/19.
//  Copyright © 2019 Cindy Royal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var name:String = ""
    var chars = Int(arc4random_uniform(10) + 2) 
    //var chars:Int = 0
    var score:Int = 0
    
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var alienButton: UIButton!
    
    @IBOutlet weak var predatorButton: UIButton!
    
    
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var myGreeting: UILabel!
    
    @IBAction func myButton(_ sender: Any) {
        let name = myName.text!
        //chars = name.count
        myGreeting.text = "Welcome, \(name)"
        myName.resignFirstResponder()
    }
    
    @IBOutlet weak var myName: UITextField!
    
    
    func didScore(points:Int){
        score = score + points
        if(score % chars == 0) {
            score=0
        }
        myScore.text = "Score: \(score)"
    }
    
    @IBAction func myAlien(_ sender: Any) {
        didScore(points:1)
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    @IBAction func myPredator(_ sender: Any) {
        didScore(points:5)
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        
        counter -= 1     //This will decrement(count down)the seconds.
        //timerLabel.text = “\(seconds)” //This will update the label
        //counter -= 1
        timerLabel.text = "\(counter)"
        if(counter == 0) {
            timerLabel.text = "Time's Up!"
            timer.invalidate()
            alienButton.isHidden = true
            predatorButton.isHidden = true
            
        }
        
    }
    
    
    @IBAction func myReset(_ sender: Any) {
        score = 0
        myScore.text = "Score: \(score)"
        timer.invalidate()
        counter = 30
        timerLabel.text = "\(counter)"
        isTimerRunning = false
        alienButton.isHidden = false
        predatorButton.isHidden = false
        chars = Int(arc4random_uniform(10) + 2) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


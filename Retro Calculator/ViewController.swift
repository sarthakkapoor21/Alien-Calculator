//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Sarthak Kapoor on 05/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buttonSound: AVAudioPlayer!
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftHandValue = ""
    var rightHandValue = ""
    var result = "0"

    @IBOutlet var resultLabel: UILabel!
    
    enum Operation: String
    {
        case Divide = "/"
        case Multiply = "x"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        currentOperation = Operation.Empty
        runningNumber = ""
        leftHandValue = ""
        rightHandValue = ""
        result = "0"
        resultLabel.text = result
    }
    
    @IBAction func dividePressed(_ sender: Any) {
        processOperation(operation: Operation.Divide)
        playButtonSound()
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        processOperation(operation: Operation.Multiply)
        playButtonSound()
    }
    
    @IBAction func subtractPressed(_ sender: Any) {
        processOperation(operation: Operation.Subtract)
        playButtonSound()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        processOperation(operation: Operation.Add)
        playButtonSound()
    }
    
    @IBAction func equalPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
        playButtonSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do
        {
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
        }
        catch let error as NSError
        {
            print(error.debugDescription)
        }
    }

    @IBAction func numberButtonPressed(_ sender: Any) {
        
        playButtonSound()
        
        runningNumber += "\((sender as AnyObject).tag!)"
        
        resultLabel.text = runningNumber
        
    }
    
    func playButtonSound()
    {
        buttonSound.play()
    }
    
    func processOperation(operation: Operation)
    {
        if currentOperation != Operation.Empty
        {
            if runningNumber != ""
            {
                rightHandValue = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Divide
                {
                    result = "\(Double(leftHandValue)! / Double(rightHandValue)!)"
                }
                else if currentOperation == Operation.Multiply
                {
                    result = "\(Double(leftHandValue)! * Double(rightHandValue)!)"
                }
                else if currentOperation == Operation.Subtract
                {
                    result = "\(Double(leftHandValue)! - Double(rightHandValue)!)"
                }
                else if currentOperation == Operation.Add
                {
                    result = "\(Double(leftHandValue)! + Double(rightHandValue)!)"
                }
                
                leftHandValue = result
                resultLabel.text = result
                
            }
            
            currentOperation = operation
            
        }
        else
        {
            leftHandValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


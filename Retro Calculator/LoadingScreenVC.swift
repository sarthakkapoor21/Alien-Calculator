//
//  LoadingScreenVC.swift
//  Retro Calculator
//
//  Created by Sarthak Kapoor on 05/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit

class LoadingScreenVC: UIViewController {
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(LoadingScreenVC.toCalculator), userInfo: nil, repeats: false)
    }
    
    func toCalculator()
    {
        performSegue(withIdentifier: "loadScreenToCalculator", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

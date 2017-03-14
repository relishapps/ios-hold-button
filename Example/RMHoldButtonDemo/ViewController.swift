//
//  ViewController.swift
//  RMHoldButtonDemo
//
//  Created by Dan Sinclair on 15/04/2016.
//  Copyright © 2016 Dan Sinclair. All rights reserved.
//

import UIKit
import RMHoldButton

class ViewController: UIViewController {

    @IBOutlet weak var holdButton: RMHoldButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Long press done!", message: "Your long press has completed. Good job!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let center = self.view.center
        
        self.holdButton.slideDuration = 1
        self.holdButton.resetDuration = 0.2
        self.holdButton.holdButtonCompletion = {() -> Void in
            self.showAlert()
        }
        
        let button2 = RMHoldButton(frame: CGRect(x: self.holdButton.frame.origin.x, y: self.holdButton.frame.origin.y + 160 , width: self.holdButton.frame.width, height: self.holdButton.frame.height), slideColor: UIColor.magenta, slideTextColor: UIColor.purple, slideDuration: 10.0)
        button2.setText("Hold me!")
        button2.setTextFont(UIFont(name: "HelveticaNeue-UltraLight", size: 25)!)
        button2.textColor = UIColor.magenta
        button2.borderColor = UIColor.magenta
        button2.holdButtonCompletion = {() -> Void in
            self.showAlert()
        }
        button2.resetDuration = 0.2
        button2.borderWidth = 3.0
        self.view.addSubview(button2)
        
        
        let button3 = RMHoldButton(frame: CGRect(x: center.x - button2.frame.height / 2, y: button2.frame.origin.y + 160 , width: button2.frame.height, height: button2.frame.height), slideColor: UIColor.green, slideTextColor: UIColor.white, slideDuration: 1.0)
        button3.backgroundColor = UIColor.clear
        button3.setText("✓")
        button3.setTextFont(UIFont.boldSystemFont(ofSize: 60))
        button3.textColor = UIColor.green
        button3.holdButtonCompletion = {() -> Void in
            self.showAlert()
        }
        button3.resetDuration = 0.2
        button3.borderWidth = 3.0
        button3.borderColor = UIColor.green
        button3.cornerRadius = button3.frame.width / 2
        self.view.addSubview(button3)
        
        
        let button4 = RMHoldButton(frame: CGRect(x: button2.frame.origin.x, y: button3.frame.origin.y + 160 , width: button2.frame.width, height: button2.frame.height), slideColor: UIColor(patternImage: UIImage(named: "bg.png")!), slideTextColor: UIColor.red, slideDuration: 1.0)
        button4.backgroundColor = UIColor.clear
        button4.setText("Hold me!")
        button4.setTextFont(UIFont(name: "Chalkduster", size: 30)!)
        button4.textColor = UIColor(red: 167/255, green: 19/255, blue: 63/255, alpha: 1.0)
        button4.slideTextColor = UIColor.blue
        button4.holdButtonCompletion = {() -> Void in
            self.showAlert()
        }
        button4.resetDuration = 0.2
        self.view.addSubview(button4)
    }

}


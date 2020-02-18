//
//  ViewController.swift
//  TConversion
//
//  Created by Y. Yang on 12/18/16.
//  Copyright © 2016 Y. Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //yyang: Add UITextFieldDelegate here

    @IBOutlet weak var t_Celsius: UITextField!
    @IBOutlet weak var t_Fahrenheit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        t_Celsius.delegate = self       //Add here to catpure "Return" key
        t_Fahrenheit.delegate = self    //Add here to catpure "Return" key
        
        //Initialize
        let tInC:Float = 0.0
        let tInF:Float = (tInC*9.0/5.0)+32.0
        t_Celsius.text = String(tInC)
        t_Fahrenheit.text = String(tInF)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//This function catures "Return" key function
        //view.endEditing(true)
        textField.resignFirstResponder()  
        
        if textField == t_Celsius {
            if let tInCx = Float(t_Celsius.text!) {
                let tInFx = (tInCx*9.0/5.0)+32.0
                t_Fahrenheit.text = String(format: "%.1f", tInFx) //one digit after point
            }
            else {
                displayAlert(msgTitle: "Wrong Celsius input", msgContent: "")
            }
        }
        else if textField == t_Fahrenheit {
                if let tInFx = Float(t_Fahrenheit.text!) {
                    let tInCx = (tInFx-32.0)*5.0/9.0
                    t_Celsius.text = String(format: "%.1f", tInCx)  //one digit after point
                } else {
                    displayAlert(msgTitle: "Wrong Fahrenheit input", msgContent: "")
                }
        }
        
        return true
        
        /*
        var tInC:Float!
        var tInF:Float!
        
        if textField == t_Celsius {
            textField.resignFirstResponder()
            tInC = Float(t_Celsius.text!)
            tInF = (tInC*9.0/5.0)+32.0
            t_Fahrenheit.text = String(tInF)
            t_Celsius.resignFirstResponder()
            //return false
        }
        else
        if textField == t_Fahrenheit {
            textField.resignFirstResponder()
            tInF = Float(t_Fahrenheit.text!)
            tInC = (tInF-32.0)*5.0/9.0
            t_Celsius.text = String(tInC)
            t_Fahrenheit.resignFirstResponder()
            //return false
        }
        return true
        */
    }

    //Editing changed --- worked!
    @IBAction func tCAction1(_ sender: Any) {
    }
    
    

    
}


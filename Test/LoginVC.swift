//
//  LoginVC.swift
//  Test
//
//  Created by Audlink on 07/05/18.
//  Copyright © 2018 Project. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {
    ///
    @IBOutlet weak var loginbtn: UIButton!
    
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        email_txt.attributedPlaceholder = NSAttributedString(string: " Email",
                                                             attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        password_txt.attributedPlaceholder = NSAttributedString(string: " Password",
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        email_txt.resignFirstResponder()
        password_txt.resignFirstResponder()
        
        return true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login_action(_ sender: Any) {
        
        if !APPUtility.isValidEmail(testStr:email_txt.text!) {
            
            let alert = UIAlertController(title: "Mivi", message: "Invalid email address", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
                
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        else  if (password_txt.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Mivi", message: "Please enter your password", preferredStyle: UIAlertControllerStyle.alert)
            
            
            
            
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
                
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        if email_txt.text == "test@mivi.com" &&  password_txt.text == "123456" {
           
            let stroy = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(stroy, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Mivi", message: "Please enter valid details", preferredStyle: UIAlertControllerStyle.alert)
            
            
            
            
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
                
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    
    }
    
    
    
}

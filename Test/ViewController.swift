//
//  ViewController.swift
//  Test
//
//  Created by Srinivas on 07/05/18.
//  Copyright © 2018 Project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
                let stroy = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
                //sleep(6)
                let nav = UINavigationController(rootViewController: stroy)
                self.present(nav, animated: true, completion: nil)
            }
        }

      
    }
    
   
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
}


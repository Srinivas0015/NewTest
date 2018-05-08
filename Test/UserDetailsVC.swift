//
//  UserDetailsVC.swift
//  Test
//
//  Created by Audlink on 07/05/18.
//  Copyright © 2018 Project. All rights reserved.
//

import UIKit

class UserDetailsVC: UIViewController {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var creditExpire: UILabel!
    @IBOutlet weak var CreditInclude: UILabel!
    @IBOutlet weak var userCreditExpire: UILabel!
    @IBOutlet weak var userCreditLeft: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var dateofBirth: UILabel!
    @IBOutlet weak var userName: UILabel!
    var Fname = String()
    var Lname = String()
    var Tname = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "User Details"
        self.navigationController?.navigationBar.isHidden = false
        let navBarColor = self.navigationController?.navigationBar
        navBarColor?.barTintColor = UIColor(hex: 0xF89238)
        navBarColor?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        //        self.navigationController!.navigationBar.backgroundColor = UIColor(red: 248/255, green: 146/255, blue: 56/255, alpha: 0.1)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //self.navigationController?.navigationBar.shadowImage = UIColor.white.as1ptImage()//UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIColor(hex: 0xde986e).as1ptImage1()
        
        //if let path = Bundle.mainBundle().pathForResource("Collection", ofType: "geojson")
        if let path = Bundle.main.path(forResource: "Collection", ofType: "geojson") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let person = jsonResult["data"] as? NSDictionary,let included = jsonResult["included"] as? NSArray  {
                    if let attributes = person["attributes"] as? NSDictionary {
                        
                        
                        for i in 0..<included.count {
                            if let values = included[i] as? NSDictionary {
                                if let atrribute = values["attributes"] as? NSDictionary {
                                    
                                    if let credit = atrribute["credit"] as? NSNumber
                                    {
                                        self.userCreditLeft.text = "Credits Left: \(String(describing: credit))"
                                    }
                                    if let creditEx = atrribute["credit-expiry"] as? String
                                    {
                                        self.userCreditExpire.text = "Credits Expiry: \(creditEx)"
                                    }
                                    //included-data-balance
                                    if let creditInc = atrribute["included-data-balance"] as? NSNumber
                                    {
                                        self.CreditInclude.text = "Credits Included: \(String(describing: creditInc))"
                                    }//expiry-date
                                    
                                    if let creditInc = atrribute["expiry-date"] as? String
                                    {
                                        self.creditExpire.text = "Credits Expiry: \(String(describing: creditInc))"
                                    }
                                    if let Pname = atrribute["name"] as? String
                                    {
                                        self.productName.text = "Product Name: \(String(describing: Pname))"
                                    }
                                    if let Pprice = atrribute["price"] as? NSNumber
                                    {
                                        self.productPrice.text = "Product Price: \(String(describing: Pprice))"
                                    }
                                }
                            }
                        }
                        
                        
                        
                    
                    if let TName =  attributes["title"] as? String {
                        self.Tname = TName
                        
                    }
                    if let fName =  attributes["first-name"] as? String {
                        self.Fname = fName
                        self.Tname = self.Tname + " \(self.Fname)"
                    }
                    if let lName =  attributes["last-name"] as? String {
                        self.Lname = lName
                        self.Tname = self.Tname + " \(Lname)"
                    }
                        self.userName.text = "Name: \(self.Tname)"
                    print(Tname)
                    if let dob =  attributes["date-of-birth"] as? String {
                        
                        self.dateofBirth.text = "DOB: \(dob)"
                        }
                        if let Phone =  attributes["contact-number"] as? String {
                            self.phoneNo.text = "Phone No: \(Phone)"
                        }
                        
                    
                    
                    // do stuff
                    print(person,included)
                }
            }
            } catch {
                // handle error
            }
        }
        
        
        // Do any additional setup after loading the view.
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
extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    func as1ptImage1() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 0.5))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 0.5))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
    
}

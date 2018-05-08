//
//  APPUtility.swift
//  Test
//
//  Created by Srinivas on 07/05/18.
//  Copyright © 2018 Project. All rights reserved.
//

import UIKit
import SystemConfiguration
//import SVProgressHUD

class APPUtility: NSObject {
    
    class func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func validatePresence(string: String) -> Bool {
        let trimmed: String = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return !trimmed.isEmpty
    }
    
    class func isValidPhoneNumber(string: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    class func isOnlyNumber(string: String) -> Bool {
        let PHONE_REGEX = "^[0-9]*"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    class func isValidPhoneNumberWithCode(string: String) -> Bool {
        let PHONE_REGEX = "^\\+?91?\\s*\\(?-*\\.*(\\d{3})\\)?\\.*-*\\s*(\\d{3})\\.*-*\\s*(\\d{4})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    class func checkPhoneOrEmail(string: String) -> Bool {
        if(self.isValidEmail(testStr: string)) {
        
        }
        else {
        
        }
        
        
        return false
    }
    
    
    //Mark: - NSUserDefaults
    class func addToNSUserDefaults(object:AnyObject, key:NSString) {
        
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(object, forKey: key  as String)
        defaults.synchronize()
        
    }
    class  func removeFromNSUserDefaults(forKey:NSString){
        let defaults:UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: forKey as String)
        defaults.synchronize()
        
    }
    class func getFromNSUserDefaults(forkey:NSString) -> AnyObject{
        let defaults:UserDefaults = UserDefaults.standard
        let robject: AnyObject? =  defaults.object(forKey: forkey as String) as AnyObject?
        
        if robject == nil
        {
            return "" as AnyObject
        }else
        {
            return robject!
        }
    }
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }

    
}




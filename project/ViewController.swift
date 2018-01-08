//
//  ViewController.swift
//  project
//
//  Created by Abhishek rane on 12/4/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if(error != nil)
        {
            print(error.localizedDescription)
            return
        }
        if let userToken = result.token {
            let token : FBSDKAccessToken = result.token
            
            print("Token = \(FBSDKAccessToken.current().tokenString)")
           
            print("User ID = \(FBSDKAccessToken.current().userID)")
            
            let HomePage = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
            let homeNav = UINavigationController(rootViewController: HomePage)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = homeNav
            
            
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user Logout")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email","user_friends"]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(FBSDKAccessToken.current() != nil){
            let HomePage = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
            let homeNav = UINavigationController(rootViewController: HomePage)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = homeNav
        }
        
    }

        
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


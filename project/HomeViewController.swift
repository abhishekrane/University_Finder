//
//  HomeViewController.swift
//  project
//
//  Created by Abhishek rane on 12/5/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class HomeViewController: UIViewController {
    @IBOutlet weak var viewConstraints: NSLayoutConstraint!
    @IBOutlet weak var sideView: UIView!
    var isSidemenuHidden = true
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBAction func openSidemenu(_ sender: UIBarButtonItem) {
       
            if isSidemenuHidden{
               viewConstraints.constant = 0
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.view.layoutIfNeeded()
                })
            }
            else{
               viewConstraints.constant = -175
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.view.layoutIfNeeded()
                })
            }
            isSidemenuHidden = !isSidemenuHidden
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 1
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        viewConstraints.constant = -175
        
    }

    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed{
            let translation = sender.translation(in: self.view).x
            if translation > 0 {
                //Swipe Right
                if viewConstraints.constant < 20{
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraints.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
                
                
                
            }else{
                //swipe left
                if viewConstraints.constant > -175{
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraints.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended{
            if viewConstraints.constant < -100{
                UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraints.constant = -175
                        self.view.layoutIfNeeded()
                    })
                
            } else{
                
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraints.constant = 0
                        self.view.layoutIfNeeded()
                    })
                
            }
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        let LoginPage = self.storyboard?.instantiateViewController(withIdentifier:"ViewController") as! ViewController
        let loginNav = UINavigationController(rootViewController: LoginPage)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginNav
        
        
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

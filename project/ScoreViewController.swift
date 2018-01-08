//
//  ScoreViewController.swift
//  project
//
//  Created by Abhishek rane on 12/12/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var array3 = NSArray()
    var array2 = NSArray()
    var array4 = NSArray()
    
    @IBAction func second(_ sender: Any) {
        
        guard let path = Bundle.main.path(forResource: "Json", ofType:"txt") else{ return }
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf : url)
            let JsonData =  NSData(contentsOfFile: path) as NSData!
            if let json = try?JSONSerialization.jsonObject(with: data, options:.allowFragments) as? NSDictionary{
                let array : NSDictionary = (json?.value(forKey: "University") as? NSDictionary)!
                array3 = array.value(forKey: "University 300-320") as! NSArray
                array2 = array.value(forKey: "University 280-300") as! NSArray
                array4 = array.value(forKey: "University 320-340") as! NSArray
            }
        
            
        }   catch{
            print(error)
        }
        
    }
    
    @IBAction func first(_ sender: Any) {
       
        guard let path = Bundle.main.path(forResource: "Json", ofType:"txt") else{ return }
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf : url)
            let JsonData =  NSData(contentsOfFile: path) as NSData!
            if let json = try?JSONSerialization.jsonObject(with: data, options:.allowFragments) as? NSDictionary{
                let array : NSDictionary = (json?.value(forKey: "University") as? NSDictionary)!
                array2 = array.value(forKey: "University 280-300") as! NSArray
                array3 = array.value(forKey: "University 300-320") as! NSArray
                array4 = array.value(forKey: "University 320-340") as! NSArray
            }
            
        }   catch{
            print(error)
        }
        
    }
    
    

    
    @IBAction func third(_ sender: Any) {

            guard let path = Bundle.main.path(forResource: "Json", ofType:"txt") else
            { return }
            let url = URL(fileURLWithPath: path)
            do{
                let data = try Data(contentsOf : url)
                let JsonData =  NSData(contentsOfFile: path) as NSData!
                if let json = try?JSONSerialization.jsonObject(with: data, options:.allowFragments) as? NSDictionary{
                    let array : NSDictionary = (json?.value(forKey: "University") as? NSDictionary)!
                    array4 = array.value(forKey: "University 320-340") as! NSArray
                    array3 = array.value(forKey: "University 300-320") as! NSArray
                    array2 = array.value(forKey: "University 280-300") as! NSArray
                   
                    
                }
                
            }   catch{
                print(error)
            }
        }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let when = DispatchTime.now() - 1.5
        DispatchQueue.main.asyncAfter(deadline: when) {
           
      
        if (segue.identifier == "thirdListSegue") {
            let secondController = segue.destination as! FirstTableViewController
            secondController.array1 = self.array4
           
            
        }
        else if (segue.identifier == "firstListSegue") {
            let secondController = segue.destination as! FirstTableViewController
            secondController.array1 = self.array2
           
        }
        else if (segue.identifier == "secondListSegue") {
            let secondController = segue.destination as! FirstTableViewController
            secondController.array1 = self.array3
           
         
        }
        
    }
    }
    

   
    override func viewDidLoad() {
        super.viewDidLoad()

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

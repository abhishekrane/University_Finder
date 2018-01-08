//
//  FirstDisplayViewController.swift
//  project
//
//  Created by Abhishek rane on 12/11/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class FirstDisplayViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var fees: UILabel!
    @IBOutlet weak var campusJobs: UILabel!
    @IBOutlet weak var jobs: UILabel!

    var display = NSDictionary()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = display.value(forKey: "Name") as! String
        fees.text = display.value(forKey: "Tuition Fess") as! String
        desc.text = display.value(forKey: "Description") as! String
        campusJobs.text = display.value(forKey: "Part-time Jobs") as! String
        jobs.text = display.value(forKey: "Jobs") as! String
        
        
        let url = NSURL(string: display.value(forKey: "imageURL") as! String)
        let data = NSData(contentsOf:url! as URL)
        if data != nil {
            image.image = UIImage(data:data! as Data)
        }
        else{
            image.image = UIImage(named: "placeholder.png")
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

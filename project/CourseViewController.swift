//
//  CourseViewController.swift
//  project
//
//  Created by Abhishek rane on 12/17/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
  
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specli: UILabel!
    
    var coursesAndSpec: Dictionary<String, Array<String>>?
    var courses:Array<String>?
    var selected:String?
    var spec:Array<String>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker!.delegate = self
        picker!.dataSource = self
        
        let bundle = Bundle.main;
        let plistURL = bundle.path(forResource: "data", ofType : "plist")
      
        
        if plistURL != nil {
            coursesAndSpec = (NSDictionary.init(contentsOfFile: plistURL!) as! Dictionary)
            courses = coursesAndSpec?.keys.sorted()
            selected = courses![0]
            spec = coursesAndSpec![selected!]!.sorted()
        }
        // Do any additional setup after loading the view.
    }

    
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard (courses != nil) && spec != nil else { return 0 }
        switch component {
        case 0: return courses!.count
        case 1: return spec!.count
        default: return 0
        }
        
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard (courses != nil) && spec != nil else { return "None" }
        switch component {
        case 0: return courses![row]
        case 1: return spec![row]
        default: return "None"
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard (courses != nil) && spec != nil else { return }
        if component == 0 && row == 0{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
            
           
            
        }
        if component == 0 && row == 1{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
            name.text = selected
        }
        if component == 0 && row == 2{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
            name.text = selected
            
        }
        if component == 0 && row == 3{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
             name.text = selected
        }
        if component == 0 && row == 4{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
             name.text = selected
        }
        if component == 0 && row == 5{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
             name.text = selected
           
        }
        if component == 0 && row == 6{
            selected = courses![row]
            spec = coursesAndSpec![selected!]!.sorted()
            pickerView.reloadComponent(1)
             name.text = selected
        }
        if component == 1 {
            selected = spec![row]
            specli.text = selected
        }
        
        
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

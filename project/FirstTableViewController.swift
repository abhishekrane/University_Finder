//
//  FirstTableViewController.swift
//  project
//
//  Created by Abhishek rane on 12/11/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit

class FirstTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var array1 = NSArray()
    var arr = NSArray()
    var uniData = NSDictionary()
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        uniData = (array1[indexPath.row] as? NSDictionary)!
        cell.name.text = uniData.value(forKey: "Name") as? String
        cell.id.text = String(describing: uniData.value(forKey: "id") as! Int )
        cell.cellview.layer.cornerRadius = cell.cellview.frame.height/2
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowSegue1", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let destination = segue.destination as? FirstDisplayViewController
        {
            destination.display = array1[(tableView.indexPathForSelectedRow?.row)!] as! NSDictionary
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
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

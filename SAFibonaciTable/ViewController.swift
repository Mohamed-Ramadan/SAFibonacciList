//
//  ViewController.swift
//  SAFibonaciTable
//
//  Created by Sulabh Agarwal on 8/19/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var fibArray:[Int] = [0,1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Create new rows and reload table
    func createFibArray( index:Int) {
      
        var index = index
        for _ in 0...5 {
            
            let newElement = fibArray[index-1] + fibArray[index]
            fibArray.append(newElement)
            
           // tableView.beginUpdates()
           // tableView.insertRows(at: [IndexPath(row: fibArray.count - 1  , section: 0)], with: .automatic)
          // tableView.endUpdates()
            index += 1
        }
        tableView.reloadData()
    }
    

}

//TABLE VIEW EXTENSION
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return fibArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = String(fibArray[indexPath.row])
        
        // Check if the last row number is the same as the last current data element
        if (indexPath.row == self.fibArray.count - 1) && indexPath.row < 90 {
             print("Creating New Rows,\(indexPath.row)")
             createFibArray(index: indexPath.row)
        }
        
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

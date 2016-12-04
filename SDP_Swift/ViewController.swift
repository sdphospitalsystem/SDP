//
//  ViewController.swift
//  SDP_Swift
//
//  Created by Andras Palfi on 12/1/16.
//  Copyright © 2016 Andras Palfi. All rights reserved.
//


import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ShowAllPatientsProtocol  {
    
    
    // outlets and variables
    @IBOutlet weak var listTableView: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

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
    
    // Properties
    var feedItems: NSArray = NSArray()
    var selectedLocation : GetAllPatients = GetAllPatients()
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set delegates and initialize ShowAllPatients
        
//        self.listTableView.delegate = self
//        self.listTableView.dataSource = self
        
        let showAllPatients = ShowAllPatients()
        showAllPatients.delegate = self
        showAllPatients.downloadItems()
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
//        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: GetAllPatients = feedItems[indexPath.row] as! GetAllPatients
        // Get references to labels of cell
        myCell.textLabel!.text = item.PName
        
        return myCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//
//  ViewController.swift
//  SDP_Swift
//
//  Created by Andras Palfi on 12/1/16.
//  Copyright © 2016 Andras Palfi. All rights reserved.
//


import Foundation
import UIKit

class ViewController: UIViewController {
    
    //Our web service url
    let URL_GET_TEAMS:String = "http://10.4.19.27/get_all_patient.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //created NSURL
        let requestURL = NSURL(string: URL_GET_TEAMS)
        
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url as URL)
        
        //setting the method to post
        request.HTTPMethod = "GET"
        
        //creating a task to send the post request
        let task = URLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            //exiting if there is some error
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                var teamJSON: NSDictionary!
                teamJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                
                //getting the JSON array teams from the response
                let teams: NSArray = teamJSON["teams"] as! NSArray
                
                //looping through all the json objects in the array teams
                for i in 0 ..< teams.count{
                    
                    //getting the data at each index
                    let teamId:Int = teams[i]["id"] as! Int!
                    let teamName:String = teams[i]["name"] as! String!
                    let teamMember:Int = teams[i]["member"] as! Int!
                    
                    //displaying the data
                    print("id -> ", teamId)
                    print("name -> ", teamName)
                    print("member -> ", teamMember)
                    print("===================")
                    print("")
                    
                }
                
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

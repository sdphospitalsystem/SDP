//
//  ShowAllPatients.swift
//  SDP_Swift
//
//  Created by Andrew T on 12/3/16.
//  Copyright © 2016 Andras Palfi. All rights reserved.
//

import Foundation

protocol ShowAllPatientsProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class ShowAllPatients: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: ShowAllPatientsProtocol!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://10.4.19.27/get_all_patient.php"
    
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: url as URL)
        
        task.resume()
        
    }
    
    
    @objc(URLSession:dataTask:didReceiveData:)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data as Data);
        
    }
    
    @objc(URLSession:task:didCompleteWithError:)
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let locations: NSMutableArray = NSMutableArray()
        
        for i in (0..<jsonResult.count)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = GetAllPatients()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let PID = jsonElement["PID"] as? Int,
                let PRFID = jsonElement["PRFID"] as? String,
                let PPassword = jsonElement["PPassword"] as? String,
                let PName = jsonElement["PName"] as? String
            {
                
                location.PID = PID
                location.PRFID = PRFID
                location.PPassword = PPassword
                location.PName = PName
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
}

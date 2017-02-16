//
//  GetAllPatients.swift
//  SDP_Swift
//
//  Created by Andrew T on 12/3/16.
//  Copyright © 2016 Andras Palfi. All rights reserved.
//

import Foundation

class GetAllPatients: NSObject {
    
    //properties
    var PID: String?
    var PRFID: String?
    var PPassword: String?
    var PName: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(PID: String, PRFID: String, PPassword: String, PName: String) {
        
        self.PID = PID
        self.PRFID = PRFID
        self.PPassword = PPassword
        self.PName = PName
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "PID: \(PID), PRFID: \(PRFID), PPassword: \(PPassword), PName: \(PName)"
        
    }
    
    
}

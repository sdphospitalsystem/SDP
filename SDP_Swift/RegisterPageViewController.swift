//
//  RegisterPageViewController.swift
//  SDP_Swift
//
//  Created by Andras Palfi on 11/7/16.
//  Copyright © 2016 Andras Palfi. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    
    //The custom variables used for saving data
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPWD: UITextField!
    
    @IBOutlet weak var registerPWDConfirm: UITextField!
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Custom action for registering a new user
    @IBAction func register(_ sender: Any) {
        let userEmail = registerEmail.text;
        let userPWD = registerPWD.text;
        let userPWD2 = registerPWDConfirm.text;
        
        
        
        //Check for empty fields
       // if (userEmail.isEmpty || userPWD.isEmpty || userPWD2.isEmpty){
         //   CustomDisplayAlert("All Fields are required!");
           // return;
        //}
        
        //Check if password match
        
        if (userPWD != userPWD2){
            //Display alert
            
            return;
        }
        
        //Store the data
        let UserStorage = UserDefaults.init()
        
        UserStorage.set(userEmail,forKey:"userEmail");
        UserStorage.set(userPWD,forKey:"registerPWD");
        
   
       // var myAlert = UIAlertController(title:"Alert",message:"You have succesfully registered!", preferredStyle:UIAlertControllerStyle.default);
        
    }

    

}

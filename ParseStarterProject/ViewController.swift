/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signUpMode = true
    
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signUpOrLoginButton: UIButton!
    
    @IBOutlet var changeSignUpOrLogin: UIButton!
    
    
    @IBAction func signUpOrLoginButton(_ sender: Any) {
        
        let userName = userNameTextField.text;
        let password = passwordTextField.text
        
        if signUpMode {
            
            let user = PFUser()
            
            user.username = userName
            user.password = password
            
            user.signUpInBackground(block: { (success, error) in
                
                
                if error != nil {
                
                    var errorMessage = "Unable to process request."
                    
                    if let parseError = error?.localizedDescription {
                        
                        errorMessage = parseError
                    }
                    
                    self.errorLabel.text = errorMessage;
                    
                } else {
                    
                    print("Sign Up Successful")
                    
                }
                
            })
            
        } else {
            
            print("Log In")
            
            PFUser.logInWithUsername(inBackground: userName!, password: password!, block: { (user, error) in
                
                if error != nil {
                    
                    var errorMessage = "Unable to process request."
                    
                    if let parseError = error?.localizedDescription {
                        
                        errorMessage = parseError
                    }
                    
                    self.errorLabel.text = errorMessage;
                    
                } else {
                    
                    print("Logged in Successfully")
                    
                }
                
            })
            
        }
        
    }
    
    
    @IBAction func changeSignUpOrLoginButton(_ sender: Any) {
        
        if signUpMode {
            
            signUpMode = false
            
            signUpOrLoginButton.setTitle("Log In", for: [])
            changeSignUpOrLogin.setTitle("Sign Up", for: [])
            
            
        } else {
            
            signUpMode = true
            
            changeSignUpOrLogin.setTitle("Log In", for: [])
            signUpOrLoginButton.setTitle("Sign Up", for: [])
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let testObject = PFObject(className: "TestObject2")
//        
//        testObject["foo"] = "bar"
//        
//        testObject.saveInBackground { (success, error) -> Void in
//            
//            // added test for success 11th July 2016
//            
//            if success {
//                
//                print("Object has been saved.")
//                
//            } else {
//                
//                if error != nil {
//                    
//                    print (error)
//                    
//                } else {
//                    
//                    print ("Error")
//                }
//                
//            }
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

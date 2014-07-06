//
//  LoginViewController.swift
//  FacebookLogin
//
//  Created by Michael Ellison on 7/5/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet var loginContentView: UIView
    @IBOutlet var emailTextField: UITextField
    @IBOutlet var passwordTextField: UITextField
    @IBOutlet var logInButton: UIButton
    @IBOutlet var signUpButton: UIButton
    

    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Configuration
    
    func moveLoginContentViews() {
        loginContentView.frame = CGRectMake(15, 20, 291, 249)
        signUpButton.frame = CGRectMake(83, 285, 155, 30)
        
    }

    
    
    // MARK: Actions
    
    @IBAction func onEmailTextField(sender: AnyObject) {
        moveLoginContentViews()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

}

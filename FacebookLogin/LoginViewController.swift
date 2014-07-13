//
//  LoginViewController.swift
//  FacebookLogin
//
//  Created by Michael Ellison on 7/5/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit
import MessageUI

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    
    @IBOutlet var loginContentView: UIView
    @IBOutlet var emailTextField: UITextField
    @IBOutlet var passwordTextField: UITextField
    @IBOutlet var logInButton: UIButton
    @IBOutlet var signUpButton: UIButton
    @IBOutlet var textFieldView: UIView
    @IBOutlet var loadingView: UIActivityIndicatorView
    

    
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureLoginInButton()
        configureTextFieldView()
        configureEmailTextField()
        configurePasswordTextField()
    }
    
    // MARK: Configuration
    
    func moveLoginContentViews() {

        UIView.animateWithDuration(0.25, animations: {
            self.loginContentView.frame = CGRectMake(15, 20, 291, 249)
            self.signUpButton.frame = CGRectMake(83, 285, 155, 30)
            })
    }
    
    func moveBackLoginContentViews() {
        UIView.animateWithDuration(0.5, animations: {
            self.loginContentView.frame = CGRectMake(15, 125, 291, 249)
            self.signUpButton.frame = CGRectMake(86, 461, 150, 30)
            })
    }

    
    // MARK: Configuration
    
    func configureTextFieldView() {
        textFieldView.layer.cornerRadius = 3
    }
    
    func configureLoginInButton() {
        logInButton.layer.cornerRadius = 3
        logInButton.enabled = false
        
    }
    
    func userEmailAndPasswordCheck() {
        
        var emailFieldInput = String(emailTextField.text)
        var passwordFieldInput = String(passwordTextField.text)
        
        if emailFieldInput == "michaelwellison@gmail.com" && passwordFieldInput == "password" {
            
            self.performSegueWithIdentifier("LogIn", sender: self)
            println("Success!")
            
        } else {
            
            var errorView = UIAlertController(title: "Incorrect Password", message: "The password or username you entered is incorrect. Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            errorView.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(errorView, animated: true, completion: nil)
            
            println("Error")
        }
    }
    
    func configureEmailTextField() {
        
        emailTextField.delegate = self
    }
    
    func configurePasswordTextField() {
        passwordTextField.delegate = self
    }
    
    // Function to create a delay method that is easy to re-use
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        println("TextFieldChanged")
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            logInButton.enabled = true
        } else {
            logInButton.enabled = false
        }
        
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        println("Text Field Should Return")
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: Actions
    
    @IBAction func onEmailTextField(sender: AnyObject) {
        moveLoginContentViews()
    
    }
    
    @IBAction func onPasswordTextField(sender: AnyObject) {
        moveLoginContentViews()
    }
    
    @IBAction func endEditing(sender: AnyObject) {
        view.endEditing(true)
        moveBackLoginContentViews()
    }
    
    @IBAction func onLoginButton(sender: AnyObject) {
        loadingView.startAnimating()
        logInButton.selected = true
        
        delay(3.0, closure: {
            self.loadingView.stopAnimating()
            self.logInButton.selected = false
            self.userEmailAndPasswordCheck()
            })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "LogIn" {
            
            
        }
        
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

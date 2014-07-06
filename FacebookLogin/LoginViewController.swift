//
//  LoginViewController.swift
//  FacebookLogin
//
//  Created by Michael Ellison on 7/5/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

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

        UIView.animateWithDuration(0.5, animations: {
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
        
        if emailFieldInput == "michael" && passwordFieldInput == "password" {
            println("Success!")
        } else {
            println("Error")
        }
    }
    
    func configureEmailTextField() {
        
        emailTextField.delegate = self
        emailTextField.tag = 0
    }
    
    func configurePasswordTextField() {
        passwordTextField.delegate = self
        passwordTextField.tag = 1
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        println("TextFieldChanged")
        logInButton.enabled = true
        
        
        
        
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
        userEmailAndPasswordCheck()
        
        
      
    
        
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

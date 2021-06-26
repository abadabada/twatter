//
//  SignUpViewController.swift
//  twatter
//
//  Created by Abba on 25/06/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let error = validateFields()
        
        //Check the fields
        if error != nil {
            let error = error!
            showError(error)
            return
        }
        else {
        //Create the user
        self.createUser(email, password, username)
        }
    }
    
    func validateFields() -> String? {
        
        //Check all fields are filled in
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !username.isEmpty,
              let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty,
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty
        else {
            let errorMessage = "Missing field"
            return errorMessage
        }
        
        //Checkk if the password is secure
        let securedpassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard Utilities.isPasswordValid(securedpassword) == true else{
            let passwordErrorMessage = "Please make sure your password is at least 8 dharacters and contains special characters"
            return passwordErrorMessage
        }
        
        return nil
    }
    
    
    
    func createUser(_ email:String,_ password:String,_ username:String){
        
        //Create user using Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] results, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                let error = error!.localizedDescription
                print(error)
                strongSelf.showError(error)
                return
            }
            
            //Store the username in the database
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: ["username": username, "uid": results!.user.uid]) { [weak self] error in
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else{
                    let error = error!.localizedDescription
                    print(error)
                    strongSelf.showError(error)
                    return
                }
            }
            
            //Trasition to the main screen
            strongSelf.transitionToTwatter()
        }
    }
    
    func transitionToTwatter(){
        let twatterViewController = storyboard?.instantiateViewController(identifier: Utilities.twatterViewController) as? TwatterViewController
        
        view.window?.rootViewController = twatterViewController
        view.window?.makeKeyAndVisible()
    }
    
    //Display error label
    func showError(_ error:String){
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
}

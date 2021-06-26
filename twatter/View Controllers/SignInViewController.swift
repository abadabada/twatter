//
//  SignInViewController.swift
//  twatter
//
//  Created by Abba on 25/06/2021.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signInTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let error = validateFields()
        //Validate the fields
        if error != nil {
            let error = error!
            print(error)
            showError(error)
            return
        } else {
            self.signIn(email, password)
            //Sign in the user
        }
    }
    
    func validateFields() -> String? {
        
        //Check all fields are filled in
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty,
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty
        else {
            let errorMessage = "Missing field"
            return errorMessage
        }
        return nil
    }
    
    func signIn(_ email:String, _ password: String){
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] results, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                let error = error!.localizedDescription
                print(error)
                strongSelf.showError(error)
                return
            }
            strongSelf.transitionToTwatter()
        }
        
    }
    
    func transitionToTwatter(){
        let twatterViewController = storyboard?.instantiateViewController(identifier: Utilities.twatterViewController) as? TwatterViewController
        
        view.window?.rootViewController = twatterViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ error:String){
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
}

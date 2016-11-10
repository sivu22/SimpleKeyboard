//
//  LoginViewController.swift
//  SimpleKeyboard
//
//  Created by Cristian Sava on 06/11/2016.
//  Copyright © 2016 Cristian Sava. All rights reserved.
//

import UIKit
import SimpleKeyboard

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var digitsTextField: UITextField!
    
    var simpleKeyboard: SimpleKeyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleKeyboard = SimpleKeyboard(fromViewController: self)
        simpleKeyboard.add(control: usernameTextField)
        simpleKeyboard.add(control: passwordTextField)
        simpleKeyboard.add(control: digitsTextField, withDoneButtonKeyboard: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        simpleKeyboard.enable()
        
        simpleKeyboard.textFieldShouldReturn = { textField in
            textField.resignFirstResponder()
            
            return true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        simpleKeyboard.disable()
    }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) {
    }
    
}

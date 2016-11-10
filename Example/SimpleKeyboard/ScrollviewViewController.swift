//
//  ScrollviewViewController.swift
//  SimpleKeyboard
//
//  Created by Cristian Sava on 06/11/2016.
//  Copyright (c) 2016 Cristian Sava. All rights reserved.
//

import UIKit
import SimpleKeyboard

class ScrollviewViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var lastVisibleTextField: UITextField!
    @IBOutlet weak var notVisibleTextField: UITextField!
    @IBOutlet weak var quiteDownTextField: UITextField!
    @IBOutlet weak var wayDownTextField: UITextField!
    
    var simpleKeyboard: SimpleKeyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleKeyboard = SimpleKeyboard.createKeyboard(forControls: [firstTextField, secondTextField, notVisibleTextField, quiteDownTextField, wayDownTextField], fromViewController: self)
        simpleKeyboard.add(control: textView, withDoneButtonKeyboard: true)
        simpleKeyboard.add(control: lastVisibleTextField, withDoneButtonKeyboard: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func unwindToScrollview(_ segue: UIStoryboardSegue) {
    }

}


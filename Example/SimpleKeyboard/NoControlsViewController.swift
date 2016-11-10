//
//  NoControlsViewController.swift
//  SimpleKeyboard
//
//  Created by Cristian Sava on 10/11/2016.
//  Copyright © 2016 Cristian Sava. All rights reserved.
//

import UIKit
import SimpleKeyboard

protocol CellKeyboardEvent {
    func willBeginEditing(fromView view: UIView)
    func willEndEditing(fromView view: UIView)
}

class NoControlsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, CellKeyboardEvent {
    
    @IBOutlet weak var normalTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var simpleKeyboard: SimpleKeyboard!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        normalTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        simpleKeyboard = SimpleKeyboard(fromViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        simpleKeyboard.enable()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        simpleKeyboard.disable()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        simpleKeyboard.setActive(view: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        simpleKeyboard.clearActiveView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: - CellKeyboardEvent
    
    func willBeginEditing(fromView view: UIView) {
        simpleKeyboard.setActive(view: view)
    }
    
    func willEndEditing(fromView view: UIView) {
        simpleKeyboard.clearActiveView()
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath) as! TableViewCell
        
        cell.delegate = self
        cell.initCell(atIndex: indexPath.row);
        
        return cell
    }
}

//
//  TableViewCell.swift
//  SimpleKeyboard
//
//  Created by Cristian Sava on 10/11/2016.
//  Copyright © 2016 Cristian SAva. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var cellTextField: UITextField!
    
    var delegate: CellKeyboardEvent?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(atIndex index: Int) {
        cellTextField.delegate = self
        cellTextField.text = "Text \(index)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.willBeginEditing(fromView: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.willEndEditing(fromView: textField)
    }

}

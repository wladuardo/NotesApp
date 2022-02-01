//
//  EntryViewController.swift
//  Notes
//
//  Created by Владислав Ковальский on 30.01.2022.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(save))
        titleField.attributedPlaceholder = NSAttributedString(
            string: "Введите название", attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.5)]
        )
        noteField!.layer.borderWidth = 0.1
        noteField!.layer.borderColor = UIColor.init(white: 1, alpha: 1).cgColor
        titleField!.layer.cornerRadius = 10
        noteField!.layer.cornerRadius = 10
    }
    
    @objc func save() {
        if let text = titleField.text, !text.isEmpty {
            completion?(text, noteField.text)
        }
    }
    
}

//
//  NoteViewController.swift
//  Notes
//
//  Created by Владислав Ковальский on 30.01.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
        editButton.action = #selector(editNote)
    }
    @IBAction func tap(_ sender: Any) {
        editButton.isEnabled = true
        noteLabel.becomeFirstResponder()
    }
    
    @objc func editNote() {
        items.removeAll{$0 == Items(title: noteTitle, note: note)}
        addItem(title: noteTitle, note: noteLabel.text)
        self.navigationController?.popToRootViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }

}

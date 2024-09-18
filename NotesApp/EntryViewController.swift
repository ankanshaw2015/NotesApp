//
//  EntryViewController.swift
//  NotesApp
//
//  Created by Yashom on 16/09/24.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteView: UITextView!
    public var completion : ((String, String) -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", image: nil, target: self, action:#selector(didTabSave))

        // Do any additional setup after loading the view.
    }
    

    @objc func didTabSave(){
        if let text = titleField.text, !text.isEmpty,!noteView.text.isEmpty{
            completion?(text,noteView.text)
            
        }
    }

}

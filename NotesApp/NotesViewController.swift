//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Yashom on 16/09/24.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet var lbl : UILabel!
    @IBOutlet var note : UITextView!
 
    
    var textTitle = String()
    var notes = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = textTitle
        note.text = notes
        
    }
   
            
}
        

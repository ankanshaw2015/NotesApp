//
//  ViewController.swift
//  NotesApp
//
//  Created by Yashom on 16/09/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var lbl: UILabel!
    var models : [(title: String, note:String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notes"
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        lbl.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func didTapNote(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as? EntryViewController else{
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "New Note"
        vc.completion = {text, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: text, note: note))
            self.lbl.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NotesViewController else{
            return
        }
        
        let model = models[indexPath.row]
        
        vc.title = "Note"
       
        navigationController?.pushViewController(vc, animated: true)
        vc.textTitle = model.title
        vc.notes = model.note
        
    }


}


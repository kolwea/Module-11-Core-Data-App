//
//  ContactTableViewController.swift
//  ContactBook
//
//  Created by Kolbe Weathington on 4/19/19.
//  Copyright © 2019 Kolbe Weathington. All rights reserved.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController {
    
//    let test = TestContact(firstName: "Kolbe", lastName: "Weathington", phoneNumber: "773 724 0486")
    var contacts = [TestContact]()
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest :NSFetchRequest<TestContact> = TestContact.fetchRequest()
        
        do{
            contacts = try managedContext.fetch(fetchRequest)
            contactTableView.reloadData()
            
        }catch{
            print("Fetch of contact data failed.")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentContact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell" , for: indexPath)
        
        let name = "\(currentContact.first!) \(currentContact.last ?? "")"
        
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(sender as? UIButton == addButton){}
        else{
            if let dest = segue.destination as? ContactDetailViewController,
                let row = contactTableView.indexPathForSelectedRow?.row {
                let contactSelected = contacts[row]
                dest.currContact = contactSelected
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

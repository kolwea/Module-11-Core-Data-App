//
//  ContactViewController.swift
//  ContactBook
//
//  Created by Kolbe Weathington on 4/19/19.
//  Copyright © 2019 Kolbe Weathington. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var currContact : TestContact?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var number: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = currContact?.first
        lastName.text = currContact?.last
        number.text = currContact?.number
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveContact(){
        let first = firstName.text
        let last = lastName.text
        let num = number.text
        
        let saveMe = TestContact(firstName: first, lastName: last, phoneNumber: num)
        
        if(first != "" && num != ""){
            do{
                let context = saveMe?.managedObjectContext
                
                try context?.save()
                
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Context could not be saved")
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

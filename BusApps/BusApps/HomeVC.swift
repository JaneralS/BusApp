//
//  ViewController.swift
//  BusApps
//
//  Created by Guest User on 10/6/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UISearchBarDelegate {

    
    
    var Bus = [BusDB]()
    

    @IBAction func LoginPressed(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: "KENT")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self
        parseBusList()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    func parseBusList(){
        let path = Bundle.main.path(forResource: "BusList", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL:path)
            let rows = csv.rows
            print(rows)
            for row in rows {
                
                let BusID = Int(row["BusID"]!)!
                let name = row["BusName"]!
                let lastrideh = Int(row["LastRideH"]!)!
                let lastridem = Int(row["LastRideM"]!)!
                
                let bus = BusDB(name: name, busid: BusID, lastrideh:lastrideh,lastridem:lastridem)
                Bus.append(bus)
                
                
                
                
            }
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    

}


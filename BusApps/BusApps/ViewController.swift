//
//  ViewController.swift
//  BusApps
//
//  Created by Guest User on 10/6/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    

}


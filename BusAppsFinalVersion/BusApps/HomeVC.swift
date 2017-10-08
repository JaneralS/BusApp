//
//  ViewController.swift
//  BusApps
//
//  Created by Guest User on 10/6/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit
import UserNotifications

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
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        center.requestAuthorization(options: options) {
            
            (granted, error) in
            
            if !granted {
                
                print("Something went wrong")
                
            }
            
        }
        
        center.getNotificationSettings { (settings) in
            
            if settings.authorizationStatus != .authorized {
                
                // Notifications not allowed
                
            }
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Last Bus Reminder"
        content.body = "The MLH bus leaves at 8:00AM!"
        content.sound = UNNotificationSound.default()
        
        
        
        let date = Date(timeIntervalSinceNow:10)
        
        
        let dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2017;
        dateComp.month = 10;
        dateComp.day = 07;
        dateComp.hour = 00;
        dateComp.minute = 00;
        dateComp.timeZone = NSTimeZone.system
        
        // are hours minute and second counting down from the from: date?
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        

        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            
            
        })
        
        
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


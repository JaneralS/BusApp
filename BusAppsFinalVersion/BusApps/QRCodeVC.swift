//
//  QRCodeVC.swift
//  BusApps
//
//  Created by Guest User on 10/7/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class QRCodeVC: UIViewController {
    
    
    

    @IBOutlet weak var QRCodeImg: UIImageView!
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var userid: UITextField!
    
    
    
    
    
    

   
    
    
    
    @IBAction func GeneraterPressed(_ sender: Any) {
        
        //let ID:String!
            //ID = "a"
        //print(ID)
        //userid.text=""
        //var AID = ID
        
         //UserDefaults.standard.set(userid.text, forKey: "myUserID")
         //userid.text = ""
        //\(UserDefaults.standard.set(userid.text, forKey: ID))"
        
        
        
        print(userid.text!)
        let imageURL = URL(string: "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=\(userid.text!)")
            var image: UIImage?
            if let url = imageURL {
                //All network operations has to run on different thread(not on main thread).
                DispatchQueue.global(qos: .userInitiated).async {
                    let imageData = NSData(contentsOf: url)
                    //All UI operations has to run on main thread.
                    DispatchQueue.main.async {
                        if imageData != nil {
                            image = UIImage(data: imageData as! Data)
                            self.QRCodeImg.image = image
                            self.QRCodeImg.sizeToFit()
                            print("YES")
                        } else {
                            print("No")
                            image = nil
                        }
                    }
                }
            }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}

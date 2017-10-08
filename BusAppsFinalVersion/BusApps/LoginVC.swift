//
//  LoginVC.swift
//  BusApps
//
//  Created by Guest User on 10/7/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    var currentID: String!

    @IBOutlet weak var InLoginBtn: UIButton!
    
    
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "menu", sender: nil)
    }
    @IBAction func HomePressed(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    var User = [UserDB]()
    var currentUser = [UserInfo]()
    
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    @IBAction func PRESSED(_ sender: Any) {
        checkPassword()
        
        
    }
    
    @IBOutlet weak var Warning: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        parseUserList()
        Warning.isHidden = true
        InLoginBtn.isHidden = true
        
        
        
        
        
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseUserList(){
        let path = Bundle.main.path(forResource: "UserList", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            for row in rows{
                let username = row["username"]!
                let password = row["password"]!
                let studentid = row["studentid"]!
                
                let user = UserDB(username: username, password: password,studentid:studentid)
                User.append(user)
                
                
                
            }
        }catch let err as NSError{
            print(err.debugDescription)
        }

    }
    
    func checkPassword(){
        var i = 0
        repeat{
            if (Username.text! == User[i].username){
                if(Password.text! == User[i].password){
                    loginPressed(Any)
                    let Cusername = User[i].username
                    let Cpassword = User[i].password
                    let Cstudentid = User[i].studentid
                    
                    let Cuser = UserInfo(username: Cusername, password: Cpassword,studentid: Cstudentid)
                    currentUser.append(Cuser)
                    var currentID = Cstudentid
                    
                    
                }else{
                    
                }
                i = i+1
            }else{
                
                i = i+1
            }
        }while(i < User.count)
        Warning.isHidden = false
        
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

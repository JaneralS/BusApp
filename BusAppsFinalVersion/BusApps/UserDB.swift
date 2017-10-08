//
//  File.swift
//  BusApps
//
//  Created by Guest User on 10/7/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import Foundation

class UserDB{
    private var _username : String!
    private var _password : String!
    private var _studentid: String!
    
    var username : String{
        return _username
    }
    var password : String{
        return _password
    }
    var studentid: String{
        return _studentid
    }
    
    init(username: String,password:String,studentid:String) {
        self._password = password
        self._username = username
        self._studentid = studentid
    }
    
}

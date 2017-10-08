//
//  BusDB.swift
//  BusApps
//
//  Created by Guest User on 10/7/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import Foundation

class BusDB{
    private var _name: String!
    private var _busid: Int!
    private var _LastRideH: Int!
    private var _LastRideM: Int!
    
    var name: String{
        return _name
    }
    
    var busid: Int{
        return _busid
    }
    
    var LastRideH: Int{
        return _LastRideH
    }
    
    var LastRideM: Int{
        return _LastRideM
    }
    
    init(name:String, busid:Int,lastrideh:Int,lastridem:Int) {
        
        self._name = name
        self._busid = busid
        self._LastRideH = lastrideh
        self._LastRideM = lastridem
    }
    
}

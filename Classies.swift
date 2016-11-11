//
//  Classies.swift
//  CookiesAndOven
//
//  Created by ALLAN CHAI on 09/11/2016.
//  Copyright © 2016 Wherevership. All rights reserved.
//

import Foundation

enum BakingStatus {
    case doughy
    case almostReady
    case ready
    case burned
}


class Cookies {
    
    var type : String
    var almostReadyTime : Int
    var readyTime : Int
    var burnedTime : Int
    
    
    init() {
        type = "Ginger"
        almostReadyTime = 37
        readyTime  = 40
        burnedTime = 43
    }
    
    func RomdomCookies() {
        let romdomNumber : Int = Int(arc4random_uniform(4))
        switch romdomNumber {
        case 1:
            self.type = "Chocolate"
            self.almostReadyTime = 13
            self.readyTime = 15
            self.burnedTime = 17
         case 2:
            self.type = "Penaut"
            self.almostReadyTime = 25
            self.readyTime = 30
            self.burnedTime = 35
        case 3:
            self.type = "Sugar"
            self.almostReadyTime = 40
            self.readyTime = 45
            self.burnedTime = 50
        default:
            self.type = "Ginger"
            self.almostReadyTime = 35
            self.readyTime = 40
            self.burnedTime = 45
        }
    }
    
    
    
}

    
class Oven {
    
    var batches : [Cookies?]
    
    init() {
        batches = [nil, nil ,nil]
    }
    
    func putBatchesToOven(cookie : Cookies, index : Int ) {
       
//        let numberOfcookie = 3
//        for  _ in 1 ... numberOfcookie {
//            let cookie : Cookies
//            cookie = Cookies()
//          //  cookie.RomdomCookiesTime()
//            batches.append(cookie)
       // batches.insert(cookie, at: index)
          batches[index] = cookie
        }

    

    func removeButches(batchesIndex : Int) {
        //batches.remove(at: batchesIndex)
        batches[batchesIndex] = nil
    }
    
    func isOvenEmpty() -> Bool {
        if batches.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func bakngTime(almostFinishTime : Int, readyTime : Int, burnedTime : Int, putintime : Int, timer : Int) -> BakingStatus {
        
        let atcualTime = timer - putintime
        if (atcualTime < almostFinishTime) {
          return   BakingStatus.doughy
        }
        else if (atcualTime  >= almostFinishTime && atcualTime < readyTime ) {
            return BakingStatus.almostReady
        }
        else  if (atcualTime >= readyTime && atcualTime < burnedTime) {
            return BakingStatus.ready
        }
        else {
            return BakingStatus.burned
        }
    }
    
   
    
    
}

//
//  ViewController.swift
//  CookiesAndOven
//
//  Created by ALLAN CHAI on 09/11/2016.
//  Copyright © 2016 Wherevership. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var BactesA: UILabel!
    @IBOutlet weak var BactesB: UILabel!
    @IBOutlet weak var BactesC: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var bactesButtonA: UIButton!
    let oven = Oven()
    var timer = Timer()
    var counter = 0
    var timerA = 0
    var currentTime = [0, 0, 0]
  // let cookies = Cookies()
    
    @IBOutlet weak var bactesButtonB: UIButton!
    @IBOutlet weak var bactesButtonC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "Timer \(counter)"
            }

    
    
            
        
    func timerAction() {
        counter += 1
        timerLabel.text = "Timer \(counter)"
        
        if (oven.batches[0] != nil){
            
            let cookieA = oven.batches[0]
            let status = oven.bakngTime(almostFinishTime: (cookieA?.almostReadyTime)!, readyTime: (cookieA?.readyTime)!, burnedTime: (cookieA?.burnedTime)!, putintime: currentTime[0], timer: counter)
            
            if (status == BakingStatus.doughy) {
                BactesA.backgroundColor = UIColor.green
            }
            else if (status == BakingStatus.almostReady) {
                BactesA.backgroundColor = UIColor.yellow
                }
            else if (status == BakingStatus.ready) {
                BactesA.backgroundColor = UIColor.blue
               
            } else if (status == BakingStatus.burned) {
                BactesA.backgroundColor = UIColor.brown

            }
            
        }
        
        if (oven.batches[1] != nil){
            
            let cookieB = oven.batches[1]
            let status = oven.bakngTime(almostFinishTime: (cookieB?.almostReadyTime)!, readyTime: (cookieB?.readyTime)!, burnedTime: (cookieB?.burnedTime)!, putintime: currentTime[1], timer: counter)
            
            if (status == BakingStatus.doughy) {
                BactesB.backgroundColor = UIColor.green
            }
            else if (status == BakingStatus.almostReady) {
                BactesB.backgroundColor = UIColor.yellow
            }
            else if (status == BakingStatus.ready) {
                BactesB.backgroundColor = UIColor.blue
                
            } else if (status == BakingStatus.burned) {
                BactesB.backgroundColor = UIColor.brown
                
            }
            
        }
        
        if (oven.batches[2] != nil){
            
            let cookieC = oven.batches[2]
            let status = oven.bakngTime(almostFinishTime: (cookieC?.almostReadyTime)!, readyTime: (cookieC?.readyTime)!, burnedTime: (cookieC?.burnedTime)!, putintime: currentTime[2], timer: counter)
            
            if (status == BakingStatus.doughy) {
                BactesC.backgroundColor = UIColor.green
            }
            else if (status == BakingStatus.almostReady) {
                BactesC.backgroundColor = UIColor.yellow
            }
            else if (status == BakingStatus.ready) {
                BactesC.backgroundColor = UIColor.blue
                
            } else if (status == BakingStatus.burned) {
                BactesC.backgroundColor = UIColor.brown
                
            }
            
        }
        
        
//        if (counter == 1) {
//            BactesA.backgroundColor = UIColor.green
//        } else if (counter >= 50) {
//            self.BactesA.backgroundColor = UIColor(red: 0.18, green: 0.37, blue: 0.68, alpha: 1)
//            
//        } else if (counter >= 30) {
//            self.BactesA.backgroundColor = UIColor(red: 0.26, green: 0.53, blue: 0.97, alpha: 1)
//        }
//        

     
    }
    

    @IBAction func onTimerButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Stop Timer" {
            sender.setTitle("Start Timer", for: .normal)
            
            timer.invalidate()
            counter = 0
            bactesButtonA.isEnabled = false
            bactesButtonB.isEnabled = false
            bactesButtonC.isEnabled = false
            oven.batches = [nil, nil, nil]
            BactesA.text = "Empty"
            BactesA.backgroundColor = UIColor.cyan
            bactesButtonA.setTitle("Put Bactes", for: .normal)
            BactesB.text = "Empty"
            BactesB.backgroundColor = UIColor.cyan
            bactesButtonB.setTitle("Put Bactes", for: .normal)
            BactesC.text = "Empty"
            
            BactesC.backgroundColor = UIColor.cyan
            bactesButtonC.setTitle("Put Bactes", for: .normal)

            
            
        } else {
            
            sender.setTitle("Stop Timer", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            bactesButtonA.isEnabled = true
            bactesButtonB.isEnabled = true
            bactesButtonC.isEnabled = true
        }
    }


    @IBAction func onBactesAButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Put Bactes" {
            sender.setTitle("Remove", for: .normal)
          let cookies = Cookies()
            cookies.RomdomCookies()
            BactesA.text = "Type: \(cookies.type), Ready Time: \(cookies.readyTime)"
            BactesA.backgroundColor = UIColor.green
            currentTime[0] = counter
            self.oven.putBatchesToOven(cookie: cookies, index: 0)
        
        } else  {
            sender.setTitle("Put Bactes", for: .normal)
           // oven.removeButches(batchesIndex: 1)
            BactesA.text = "Empty"
            BactesA.backgroundColor = UIColor.cyan
            //timerA = counter
            self.oven.removeButches(batchesIndex: 0)
             currentTime[0] = 0

            
            
        }
    }
    
    
    @IBAction func OnBactesBButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Put Bactes" {
            sender.setTitle("Remove", for: .normal)
            let cookies = Cookies()
            cookies.RomdomCookies()
            BactesB.text = "Type: \(cookies.type), Ready Time: \(cookies.readyTime) "
            BactesB.backgroundColor = UIColor.green
            self.oven.putBatchesToOven(cookie: cookies, index: 1)
            currentTime[1] = counter
           // Oven.isOvenEmpty() = true
        } else  {
            sender.setTitle("Put Bactes", for: .normal)
           // oven.removeButches(batchesIndex: 2)
            BactesB.text = "Empty"
            BactesB.backgroundColor = UIColor.cyan
            self.oven.removeButches(batchesIndex: 1)
            currentTime[1] = 0
        }
    }
   
    @IBAction func OnBactesCButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Put Bactes" {
            sender.setTitle("Remove", for: .normal)
           let cookies = Cookies()
            cookies.RomdomCookies()
            BactesC.text = "Type: \(cookies.type), Ready Time: \(cookies.readyTime) "
            BactesC.backgroundColor = UIColor.green
            self.oven.putBatchesToOven(cookie: cookies, index: 2)
            currentTime[2] = counter
        } else  {
            sender.setTitle("Put Bactes", for: .normal)
           // oven.removeButches(batchesIndex: 3)
            BactesC.text = "Empty "
            BactesC.backgroundColor = UIColor.cyan
            self.oven.removeButches(batchesIndex: 2)
            currentTime[2] = 0

        }
        
    }
 }


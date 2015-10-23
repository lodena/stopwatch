//
//  ViewController.swift
//  Navigation Bars
//
//  Created by Jesus Lopez de Nava on 7/3/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlay = true
    
    var timer = NSTimer()
    
    var count = 0
    
    var hund = 0
    var strHund = ""
    
    var sec:Int = 0
    var strSec = ""
    
    var min = 0
    var strMin = ""
   
    @IBOutlet var minLabel: UILabel!
    
    @IBOutlet var secLabel: UILabel!
    
    @IBOutlet var hundLabel: UILabel!

    @IBOutlet var toolBar: UIToolbar!
    
    @IBOutlet var clearButton: UIBarButtonItem!
    
    @IBAction func play(sender: AnyObject) {
        
        playPause()
        
    }
    
    @IBAction func reset(sender: AnyObject) {
        
        count = 0
        hund = 0
        sec = 0
        min = 0
        
        minLabel.text = "00"
        secLabel.text = "00"
        hundLabel.text = "00"
        
        clearButton.enabled = false
        
    }
    
    func playPause() {
        
        var toggleBtn: UIBarButtonItem
        
        var items = toolBar.items!
    
        if isPlay {
            
            toggleBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "playPause")
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
            
            clearButton.enabled = false
            
        } else {
            
            toggleBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playPause")
            
            timer.invalidate()
            
            clearButton.enabled = true
            
        }
        
        items[0] = toggleBtn
        
        toolBar.setItems(items, animated: true)
        
        isPlay = !isPlay
        
    }

    func result() {
        
        count++
        
        hund = count % 100
        sec = count / 100
        
        if sec == 60 {
            
            min++
            count = 0
        }
        
        strHund = String(hund)
        if hund < 10 {
            strHund = "0" + strHund
        }
        
        strSec = String(sec)
        if sec < 10 {
            strSec = "0" + strSec
        }
        
        strMin = String(min)
        if min < 10 {
            strMin = "0" + strMin
        }
    
        minLabel.text = strMin
        secLabel.text = strSec
        hundLabel.text = strHund
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


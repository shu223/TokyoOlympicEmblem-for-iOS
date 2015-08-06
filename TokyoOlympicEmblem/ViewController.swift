//
//  ViewController.swift
//  TokyoOlympicEmblem
//
//  Created by Shuichi Tsutsumi on 2015/08/06.
//  Copyright (c) 2015年 Shuichi Tsutsumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var toeView: TOEView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func modeChanged(sender: UISegmentedControl) {
        
        let type = TOEView.EmblemType(rawValue: sender.selectedSegmentIndex)

        if type != nil {
            toeView.type = type!
            toeView.setNeedsDisplay()
        }
    }
}


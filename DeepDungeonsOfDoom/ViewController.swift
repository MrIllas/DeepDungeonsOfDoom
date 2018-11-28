//
//  ViewController.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 28/11/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var btnChar1: UIButton!
    @IBOutlet weak var btnChar2: UIButton!
    @IBOutlet weak var btnChar3: UIButton!
    
    @IBAction func selChar(_ sender: AnyObject) {
        switch sender.tag{
            case 1:
                print("1")
                break
            case 2:
                print("2")
                break
            case 3:
                print("3")
                break
            default:
                print("Woops!")
        }
    }

}

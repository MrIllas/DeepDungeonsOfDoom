//
//  Menu.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 12/12/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnDungeon: UIButton!
    @IBOutlet weak var btnInventory: UIButton!
    @IBOutlet weak var btnShop: UIButton!
    
    
    @IBAction func onBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "start") as? ViewController
        self.present(newView!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickToDungeon(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "dungeon") as? Dungeon
        self.present(newView!, animated: true, completion: nil)
    }
    
    @IBAction func onClickToInventory(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "inventory") as? Inventory
	        self.present(newView!, animated: true, completion: nil)    }
    
    
    @IBAction func onClickToShop(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "shop") as? Shop
        self.present(newView!, animated: true, completion: nil)    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

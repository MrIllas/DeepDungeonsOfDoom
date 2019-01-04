//
//  Inventory.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 19/12/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class Inventory: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var imgHelmet: UIImageView!
    @IBOutlet weak var imgArmour: UIImageView!
    @IBOutlet weak var imgBoots: UIImageView!
    @IBOutlet weak var imgRing: UIImageView!
    @IBOutlet weak var imgShield: UIImageView!
    @IBOutlet weak var imgSword: UIImageView!
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAtq: UILabel!
    @IBOutlet weak var labelDef: UILabel!
    @IBOutlet weak var labelLck: UILabel!
    @IBOutlet weak var labelMag: UILabel!
    @IBOutlet weak var labelMoney: UILabel!
    @IBOutlet weak var labelExp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        // Do any additional setup after loading the view.
    }
    
    func loadImage(){
        
        imgHero.image = charHero[selectedHero].getImagen()
        imgHelmet.image = charHero[selectedHero].getStuff(index: 0).getImagen()
        imgArmour.image = charHero[selectedHero].getStuff(index: 1).getImagen()
        imgBoots.image = charHero[selectedHero].getStuff(index: 2).getImagen()
        imgRing.image = charHero[selectedHero].getStuff(index: 4).getImagen()
        imgShield.image = charHero[selectedHero].getStuff(index: 5).getImagen()
        imgSword.image = charHero[selectedHero].getStuff(index: 4).getImagen()
        
        labelName.text = charHero[selectedHero].getNombre()
        labelAtq.text = String(charHero[selectedHero].getAtq())
        labelDef.text = String(charHero[selectedHero].getDef())
        labelLck.text = String(charHero[selectedHero].getLck())
        labelMag.text = String(charHero[selectedHero].getMoney())
        labelExp.text = String(charHero[selectedHero].getExp())
    }
    
    @IBAction func onBtnBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "menu") as? Menu
        self.present(newView!, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Fight.swift
//  DeepDungeonsOfDoom
//
//  Created by dmorenoar on 05/01/2019.
//  Copyright © 2019 RobertRecordà. All rights reserved.
//

import UIKit

class Fight: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var btnAttack: UIButton!
    
    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var monsterHitLab: UILabel!
    @IBOutlet weak var heroHitLab: UILabel!
    
    @IBOutlet weak var monsterPickerView: UIPickerView!
    @IBOutlet weak var heroPickerView: UIPickerView!
    
    
    var diceHero:[String] = [
        "dice1U",
        "dice2U",
        "dice3U",
        "dice4U",
        "dice5U",
        "dice6U",
        "dice7U",
        "dice8U",
        "dice9U",
        "dice10U",
        "dice11U",
        "dice12U"
    ]
    
    var diceMonster:[String] = [
        "dice1",
        "dice2",
        "dice3",
        "dice4",
        "dice5",
        "dice6",
        "dice7",
        "dice8",
        "dice9",
        "dice10",
        "dice11",
        "dice12"
    ]
    
    @IBAction func onBtnBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "dungeon") as? Dungeon
        self.present(newView!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updater()
        // Do any additional setup after loading the view.
    }
    
    func updater(){
        monsterImg.image = monsterList[numMonster].getImage()
        heroImg.image =  charHero[selectedHero].getImagen()
        
        var hpHero:Int = charHero[selectedHero].getVida()
        var xCorazon:Int = 160
        for i in 0..<hpHero{
            var viewCorazon = UIImageView(image: UIImage(named: "heart"))
            viewCorazon.frame = CGRect(x: xCorazon, y: 740, width: 20, height: 20)
            view.addSubview(viewCorazon)
            xCorazon += 22
            
        }
        
        var hpMonster:Int = monsterList[numMonster].getVida()
        xCorazon = 160
        for i in 0..<hpMonster{
            var viewCorazon = UIImageView(image: UIImage(named: "heart"))
            viewCorazon.frame = CGRect(x: xCorazon, y: 160, width: 20, height: 20)
            view.addSubview(viewCorazon)
            xCorazon += 22
            
        }
    }
    
    //HERO PICKERVIEW
    func numberOfComponents(in heroPickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ heroPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diceHero.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var tmpView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        if pickerView.tag == 1 {
            var tempImg = UIImageView(image: UIImage(named: "\(diceMonster[row])"))
            tempImg.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            tmpView.addSubview(tempImg)
        }else{
            var tempImg = UIImageView(image: UIImage(named: "\(diceHero[row])"))
            tempImg.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            tmpView.addSubview(tempImg)
        }
        
        
        return tmpView
    }
    
    
    //MONSTER PICKERVIEW
}

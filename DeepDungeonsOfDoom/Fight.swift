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
    @IBOutlet weak var btnFinish: UIButton!
    
    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var monsterHitLab: UILabel!
    @IBOutlet weak var heroHitLab: UILabel!
    @IBOutlet weak var monsterHpLab: UILabel!
    @IBOutlet weak var heroHpLab: UILabel!
    
    
    
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
    
    var dNumHero:Int = 0
    var dNumMonster:Int = 0
    var monsterHit:Int = 0
    var heroHit:Int = 0
    var monsterHp:Int = 0
    
    @IBAction func onBtnBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "dungeon") as? Dungeon
        self.present(newView!, animated: true, completion: nil)
    }
    @IBAction func onBtnFinishClick(_ sender: Any) {
        onBtnBackClick((Any).self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnFinish.isHidden = true
        btnFinish.isEnabled = false
        
        monsterHp = monsterList[numMonster].getVida()
        updater()
        // Do any additional setup after loading the view.
    }
    
    func updater(){
        
        monsterImg.image = monsterList[numMonster].getImage()
        heroImg.image =  charHero[selectedHero].getImagen()
        
        heroHitLab.text = "\(heroHit)"
        monsterHitLab.text = "\(monsterHit)"
        
        heroHpLab.text = "\(charHero[selectedHero].getVida())"

        monsterHpLab.text = "\(monsterHp)"
        
    }
    
    //HERO PICKERVIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == monsterPickerView{
        if monsterList[numMonster].getAtq() <= 10{
            dNumMonster = 1
            
        }else if monsterList[numMonster].getAtq() <= 25{
            dNumMonster = 2
        }else if monsterList[numMonster].getAtq() > 25{
            dNumMonster = 3
        }
            return dNumMonster
        }else{
        if charHero[selectedHero].getHit() <= 10{
            dNumHero = 1
        }else if charHero[selectedHero].getHit() <= 25{
            dNumHero = 2
        }else if charHero[selectedHero].getHit() > 25{
            dNumHero = 3
        }
            return dNumHero
        }
        return 1
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
    
    @IBAction func onBtnAttackClick(_ sender: Any) {
        monsterHit = 0
        heroHit = 0
        
        for h in 0..<dNumMonster{
            var number:Int = Int.random(in: 0..<12)
            monsterPickerView.selectRow(number, inComponent: h, animated: false)
            monsterHit = monsterHit + (number + 1)
        }
        
        for h in 0..<dNumHero{
            var number:Int = Int.random(in: 0..<12)
            heroPickerView.selectRow(number, inComponent: h, animated: false)
            heroHit = heroHit + (number + 1)
        }
        
        if heroHit < monsterHit{
            charHero[selectedHero].lessVida()
            print("Hero: \(charHero[selectedHero].getVida())")
        }else if heroHit > monsterHit{
            monsterHp = monsterHp - 1
            print("Monster: \(monsterHp)")
        }
        
        if monsterHp == 0{
            charHero[selectedHero].incressMoney(money: monsterList[numMonster].getMoney())
            charHero[selectedHero].setExp(exp: monsterList[numMonster].getExp())
            
            let alert = UIAlertController(title: "End of the battle", message: "You win!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            btnFinish.isEnabled = true
            btnFinish.isHidden = false
        }
        if charHero[selectedHero].getVida() == 0{
            
            let alert = UIAlertController(title: "End of the battle", message: "You lose!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            btnFinish.isEnabled = true
            btnFinish.isHidden = false
            
        }
        
        updater()
    }
    
}

//
//  Dungeon.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 19/12/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

var numMonster:Int! = 0

class Dungeon: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnFight: UIButton!
    
    
    @IBAction func onBtnBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "menu") as? Menu
        self.present(newView!, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monsterList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 130
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numMonster = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var tmpView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 230, height: 130))
        
        var img:UIImage = monsterList[row].getImage()
        var tempImg = UIImageView(image: img)
        tempImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        var nameLabel = UILabel(frame: CGRect(x: 105, y: 5, width: 200, height: 21))
        var atqLabel = UILabel(frame: CGRect(x: 105, y: 26, width: 100, height: 21))
        var expLabel = UILabel(frame: CGRect(x: 105, y: 47, width: 100, height: 21))
        var moneyLabel = UILabel(frame: CGRect(x: 105    , y: 68, width: 100, height: 21))
        
        nameLabel.text = "Name: \(monsterList[row].getName())"
        atqLabel.text = "Damage: \(monsterList[row].getAtq())"
        expLabel.text = "Exp: \(monsterList[row].getExp())"
        moneyLabel.text = "Money: \(monsterList[row].getMoney())"
        
        nameLabel.font = UIFont(name: "Halvetica", size: 12)
        atqLabel.font = UIFont(name: "Halvetica", size: 12)
        expLabel.font = UIFont(name: "Halvetica", size: 12)
        moneyLabel.font = UIFont(name: "Halvetica", size: 12)
        
        nameLabel.textColor = UIColor.white
        atqLabel.textColor = UIColor.white
        expLabel.textColor = UIColor.white
        moneyLabel.textColor = UIColor.white
        
        tmpView.addSubview(nameLabel)
        tmpView.addSubview(atqLabel)
        tmpView.addSubview(expLabel)
        tmpView.addSubview(moneyLabel)
        tmpView.addSubview(tempImg)
        
        return tmpView
    }
    
    @IBAction func onBtnFightClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "fight") as? Fight
        self.present(newView!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numMonster = numMonster + 0
        
        if charHero[selectedHero].getVida() == 0{
            btnFight.isEnabled = false
        }
        
        // Do any additional setup after loading the view.
    }
    


}

//
//  Dungeon.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 19/12/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class Dungeon: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnFight: UIButton!
    
    var theMonster:Monster!
    
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
        return 180
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theMonster = monsterList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var tmpView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        var img:UIImage = monsterList[row].getImage()
        var tempImg = UIImageView(image: img)
        tempImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        var nameLabel = UILabel(frame: CGRect(x: 105, y: 5, width: 100, height: 21))
        var atqLabel = UILabel(frame: CGRect(x: 105, y: 26, width: 100, height: 21))
        var expLabel = UILabel(frame: CGRect(x: 105, y: 47, width: 100, height: 21))
        var moneyLabel = UILabel(frame: CGRect(x: 105    , y: 68, width: 100, height: 21))
        
        nameLabel.text = "Attack: \(monsterList[row].getName())"
        atqLabel.text = "Defense: \(monsterList[row].getAtq())"
        expLabel.text = "Magic: \(monsterList[row].getExp())"
        moneyLabel.text = "Lucky: \(monsterList[row].getMoney())"
        
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
        // Do any additional setup after loading the view.
    }
    


}

//
//  Shop.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 19/12/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class Shop: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var labelMoney: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnBuy: UIButton!
    
    var playerMoney:Int = 0
    
    @IBAction func onBtnBackClick(_ sender: Any) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "menu") as? Menu
        self.present(newView!, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updater()
        // Do any additional setup after loading the view.
    }
    
    func updater(){
        playerMoney = charHero[selectedHero].getMoney()
        labelMoney.text = String(playerMoney)
    }
    
    var theCost:Int = 250
    var theNumber:Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 180
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theCost = itemList[row].getCost()
        theNumber = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var tmpView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        var img:UIImage = itemList[row].getImagen()
        var tempImg = UIImageView(image: img)
        tempImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        var atqLabel = UILabel(frame: CGRect(x: 105, y: 5, width: 100, height: 21))
        var defLabel = UILabel(frame: CGRect(x: 105, y: 26, width: 100, height: 21))
        var magLabel = UILabel(frame: CGRect(x: 105, y: 47, width: 100, height: 21))
        var lckLabel = UILabel(frame: CGRect(x: 105	, y: 68, width: 100, height: 21))
        var costLabel = UILabel(frame: CGRect(x: 190, y: 5, width: 100, height: 21))
        
        atqLabel.text = "Attack: \(itemList[row].getAtq())"
        defLabel.text = "Defense: \(itemList[row].getDef())"
        magLabel.text = "Magic: \(itemList[row].getMag())"
        lckLabel.text = "Lucky: \(itemList[row].getLck())"
        costLabel.text = "Cost: \(itemList[row].getCost())"
        
        atqLabel.font = UIFont(name: "Halvetica", size: 12)
        defLabel.font = UIFont(name: "Halvetica", size: 12)
        magLabel.font = UIFont(name: "Halvetica", size: 12)
        lckLabel.font = UIFont(name: "Halvetica", size: 12)
        costLabel.font = UIFont(name: "Halvetica", size: 12)
        
        atqLabel.textColor = UIColor.white
        defLabel.textColor = UIColor.white
        magLabel.textColor = UIColor.white
        lckLabel.textColor = UIColor.white
        costLabel.textColor = UIColor.white
        
        tmpView.addSubview(atqLabel)
        tmpView.addSubview(defLabel)
        tmpView.addSubview(magLabel)
        tmpView.addSubview(lckLabel)
        tmpView.addSubview(tempImg)
        tmpView.addSubview(costLabel)
        
        return tmpView
    }
    
    
    
    @IBAction func onClickBuy(_ sender: Any) {
        if playerMoney >= theCost {
            charHero[selectedHero].setMoney(money: (playerMoney - theCost))
            print("\(itemList[theNumber].getType())")
            switch itemList[theNumber].getType(){
            case "potion":
                
                break
            case "shield":
                charHero[selectedHero].setStuff(index: 5, item: itemList[theNumber])
                break
            case "weapon":
                charHero[selectedHero].setStuff(index: 4, item: itemList[theNumber])
                break
            case "accesory":
                charHero[selectedHero].setStuff(index: 3, item: itemList[theNumber])
                break
            case "coat":
                charHero[selectedHero].setStuff(index: 6, item: itemList[theNumber])
                break
            case "boots":
                charHero[selectedHero].setStuff(index: 2, item: itemList[theNumber])
                break
            case "chest":
                charHero[selectedHero].setStuff(index: 1, item: itemList[theNumber])
                break
            case "head":
                charHero[selectedHero].setStuff(index: 0, item: itemList[theNumber])
                break
            default:
                print("no")
            }
            updater()
        }
    }
    
}

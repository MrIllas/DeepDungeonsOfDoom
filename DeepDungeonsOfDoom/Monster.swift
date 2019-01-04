//
//  Monster.swift
//  DeepDungeonsOfDoom
//
//  Created by dmorenoar on 04/01/2019.
//  Copyright © 2019 RobertRecordà. All rights reserved.
//

import Foundation
import UIKit

class Monster{
    var name:String = ""
    var atq:Int = 0
    var health:Int = 0
    var exp:Int = 0
    var money:Int = 0
    var image:UIImage! = UIImage(named: "hero4")

    init(name:String, atq:Int, health:Int, exp:Int, money:Int, image:UIImage){
        self.name = name
        self.atq = atq
        self.health = health
        self.exp = exp
        self.money = money
        self.image = image
    }
    
    func getName()-> String{
        return self.name
    }
    
    func getAtq()-> Int {
        return self.atq
    }
    
    func getExp()-> Int{
        return self.exp
    }
    
    func getMoney()-> Int{
        return self.money
    }
    
    func getImage()-> UIImage{
        return self.image
    }
}



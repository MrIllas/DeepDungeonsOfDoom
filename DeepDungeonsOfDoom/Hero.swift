//
//  Hero.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 28/11/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import Foundation
import UIKit

class Hero{
    /*Un personaje tiene una vida, nombre, dinero, exp y un conjuto de ítems que podríamos
    agrupar en algo que llamamos “Stuff”. Los ítems le ayudan a calcular sus habilidades. Estas
    habilidades se calculan con la suma de los diferentes atributos que tienen los ítems. Por lo
    tanto, gracias a estos ítems podremos saber los atributos de : Ataque (ATQ), Defensa (DEF),
    Magia (MAG), Suerte (LCK).
    */
    var vida:Int! = 0
    var nombre:String! = ""
    var dinero:Int! = 0
    var exp:Int! = 0
    var Stuff:[Item]! = []
    
    var ataque:Int! = 0
    var defensa:Int! = 0
    var magia:Int! = 0
    var suerte:Int! = 0
    
    var imagen:UIImage! = UIImage(named: "hero4")
    
    init(vida:Int!, nombre:String!, dinero:Int!, exp:Int!, Stuff:[Item]!, ataque:Int!, defensa:Int!, magia:Int!, suerte:Int!, imagen:UIImage?){
        self.vida = vida
        self.nombre = nombre
        self.dinero = dinero
        self.exp = dinero
        self.Stuff = Stuff
        
        self.ataque = ataque
        self.defensa = defensa
        self.magia = magia
        self.suerte = suerte
        
        self.imagen = imagen
    }
    
    func getImagen() -> UIImage{
        return self.imagen
    }
    
    func getVida() -> Int{
        return self.vida
    }
    
    func getNombre()->String{
        return self.nombre
    }
    
    func getAtq()-> Int{
        return self.ataque + calc(type: "atq")
    }
    func getDef()-> Int{
        return self.defensa + calc(type: "def")
    }
    func getMag()-> Int{
        return self.magia + calc(type: "mag")
    }
    func getLck()-> Int{
        return self.suerte + calc(type: "lck")
    }
    
    func getMoney()-> Int{
        return self.dinero
    }
    
    func getExp()-> Int{
        return self.exp
    }
    
    func calc(type:String) -> Int{
        var toReturn:Int! = 0
        for i in Stuff{
            switch type{
            case "atq":
                toReturn += i.getAtq()
                break
            case "def":
                toReturn += i.getDef()
                break
            case "mag":
                toReturn += i.getMag()
                break
            case "lck":
                toReturn += i.getLck()
                break
            default:
                print("Hello")
            }
        }
        return toReturn
    }
    
    func getStuff(index:Int)-> Item{
        return self.Stuff[index]
    }
    
    func setMoney(money:Int){
        self.dinero = money
    }
    
    func setStuff(index:Int, item:Item){
        self.Stuff[index] = item
    }
    
    func getHit()-> Int{
        var hit:Int = 0
        
        hit = (ataque+defensa+magia+suerte)/4
        
        return hit
    }
    
    func lessVida (){
        self.vida = vida - 1
    }
    
    func setExp(exp:Int){
        self.exp = self.exp + 1
    }
}

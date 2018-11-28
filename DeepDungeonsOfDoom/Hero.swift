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
    var Stuff:[Item]!
    
    var ataque:Int! = 0
    var defensa:Int! = 0
    var magia:Int! = 0
    var suerte:Int! = 0
    
    var imagen:UIImage?
    
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
}

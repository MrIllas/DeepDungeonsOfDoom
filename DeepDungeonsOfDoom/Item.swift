//
//  Item.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 28/11/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import Foundation
import UIKit

class Item {
/*Un ítem cuesta un dinero y se compone de diferentes propiedades: Ataque (ATQ), Defensa
 (DEF), Magia (MAG), Suerte (LCK).*/
    
    var nombre:String! = ""
    var coste:Int! = 0
    
    var ataque:Int! = 0
    var defensa:Int! = 0
    var magia:Int! = 0
    var suerte:Int! = 0
    
    var imagen:UIImage?
    
    init(nombre:String!, coste:Int!, ataque:Int!, defensa:Int!, magia:Int!, suerte:Int!, imagen:UIImage?){
        self.nombre = nombre
        self.coste = coste
        
        self.ataque = ataque
        self.defensa = defensa
        self.magia = magia
        self.suerte = suerte
        
        self.imagen = imagen
    }
}

//
//  ViewController.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 28/11/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize objects
        itemDeclaration()
        charDeclaration()
    }
    
    @IBOutlet weak var btnChar1: UIButton!
    @IBOutlet weak var char1Skin: UIImageView!
    
    
    @IBOutlet weak var btnChar2: UIButton!
    @IBOutlet weak var btnChar3: UIButton!
    
    var charHero:[Hero]!
    var itemList:[Item]!
    var startMoney:Int! = 0
    var startExp:Int! = 0
    
    var char1Item:[Item]!
    var char2Item:[Item]!
    var char3Item:[Item]!
    
    @IBAction func selChar(_ sender: AnyObject) {
        switch sender.tag{
            case 1:
                print("1")
                break
            case 2:
                print("2")
                break
            case 3:
                print("3")
                break
            default:
                print("Woops!")
        }
    }
    
    func itemDeclaration(){
        //Casco
        itemList.append(Item.init(nombre: "Casco del caballero", coste: 250, ataque: 0, defensa: 7, magia: 0, suerte: 2, imagen: UIImage(named: "helmet1")))
        itemList.append(Item.init(nombre: "Gran casco adornado", coste: 400, ataque: 0, defensa: 9, magia: 2, suerte: 2, imagen: UIImage(named: "helmet2")))
        itemList.append(Item.init(nombre: "Sombreo de brujo", coste: 150, ataque: 0, defensa: 2, magia: 3, suerte: 0, imagen: UIImage(named: "helmet3")))
        itemList.append(Item.init(nombre: "Casco vikingo", coste: 200, ataque: 0, defensa: 5, magia: 0, suerte: 2, imagen: UIImage(named: "helmet4")))
        itemList.append(Item.init(nombre: "Casco del soldado", coste: 150, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "helmet5")))
        
        //Pechera
        itemList.append(Item.init(nombre: "Pechera de hierro", coste: 100, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "armour")))
        itemList.append(Item.init(nombre: "Gran pechera de hierro", coste: 300, ataque: 0, defensa: 9, magia: 0, suerte: 0, imagen: UIImage(named: "armour2")))
        itemList.append(Item.init(nombre: "Pechera de cuero", coste: 200, ataque: 0, defensa: 5, magia: 0, suerte: 0, imagen: UIImage(named: "armour3")))
        
        //Botas
        itemList.append(Item.init(nombre: "Botas de cuero comun", coste: 100, ataque: 0, defensa: 1, magia: 0, suerte: 0, imagen: UIImage(named: "boots")))
        itemList.append(Item.init(nombre: "Botas de malla comun", coste: 200, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "boots2")))
        
        //Capa
        itemList.append(Item.init(nombre: "Capa negra", coste: 100, ataque: 0, defensa: 1, magia: 1, suerte: 0, imagen: UIImage(named: "cap")))
        itemList.append(Item.init(nombre: "Capa roja", coste: 150, ataque: 0, defensa: 1, magia: 2, suerte: 0, imagen: UIImage(named: "cap2")))
        itemList.append(Item.init(nombre: "Capa marron", coste: 200, ataque: 0, defensa: 2, magia: 2, suerte: 0, imagen: UIImage(named: "cap3")))
        
        //Collar
        itemList.append(Item.init(nombre: "Collar de huesos", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 2, imagen: UIImage(named: "necklace")))
        
        //Anillos
        itemList.append(Item.init(nombre: "Anillo con diamante", coste: 300, ataque: 0, defensa: 0, magia: 5, suerte: 4, imagen: UIImage(named: "ring")))
        itemList.append(Item.init(nombre: "Anillo de oro", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 1, imagen: UIImage(named: "ring2")))
        
        //Espadas
        itemList.append(Item.init(nombre: "Espada de madera", coste: 100, ataque: 1, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword4")))
        itemList.append(Item.init(nombre: "Espada de hierro", coste: 150, ataque: 2, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword1")))
        itemList.append(Item.init(nombre: "Espada de fuego", coste: 250, ataque: 5, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword2")))
        itemList.append(Item.init(nombre: "Espada divina", coste: 500, ataque: 10, defensa: 0, magia: 0, suerte: 4, imagen: UIImage(named: "sword3")))
        
        //Arco
        itemList.append(Item.init(nombre: "Arco comun", coste: 100, ataque: 3, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow")))
        itemList.append(Item.init(nombre: "Arco del soldado", coste: 200, ataque: 5, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow2")))
        itemList.append(Item.init(nombre: "Gran arco", coste: 300, ataque: 9, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow3")))
        
        //Cetro
        itemList.append(Item.init(nombre: "Cetro de oro", coste: 200, ataque: 2, defensa: 0, magia: 4, suerte: 0, imagen: UIImage(named: "scepter")))
        itemList.append(Item.init(nombre: "Cetro de diamante", coste: 500, ataque: 5, defensa: 0, magia: 10, suerte: 2, imagen: UIImage(named: "scepter2")))
        itemList.append(Item.init(nombre: "Cetro comun", coste: 100, ataque: 1, defensa: 0, magia: 2, suerte: 0, imagen: UIImage(named: "scepter3")))
        
        //Escudos
        itemList.append(Item.init(nombre: "Escudo de hierro", coste: 100, ataque: 0, defensa: 5, magia: 0, suerte: 0, imagen: UIImage(named: "shield")))
        itemList.append(Item.init(nombre: "Escudo de avenzo", coste: 200, ataque: 0, defensa: 7, magia: 0, suerte: 0, imagen: UIImage(named: "shield2")))
        itemList.append(Item.init(nombre: "Escudo de espejos", coste: 300, ataque: 0, defensa: 5, magia: 3, suerte: 0, imagen: UIImage(named: "shield3")))
        itemList.append(Item.init(nombre: "Escudo de madera", coste: 50, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "shield4")))
        
        //Pociones
        itemList.append(Item.init(nombre: "Poción pequeña de sanación", coste: 50, ataque: 0, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "potion2")))
        itemList.append(Item.init(nombre: "Gran poción de sanación", coste: 100, ataque: 0, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "potion")))
    }
    
    func charDeclaration(){
        charHero.append(Hero.init(vida: 4, nombre: "Soldier66", dinero: startMoney, exp: startExp, Stuff: char1Item, ataque: 3, defensa: 8, magia: 1, suerte: 3, imagen: UIImage(named: "hero1")))
        charHero.append(Hero.init(vida: 4, nombre: "Ashe", dinero: startMoney, exp: startExp, Stuff: char2Item, ataque: 5, defensa: 5, magia: 0, suerte: 8, imagen: UIImage(named: "hero2")))
        charHero.append(Hero.init(vida: 4, nombre: "Kel'thuzad", dinero: startMoney, exp: startExp, Stuff: char3Item, ataque: 4, defensa: 3, magia: 8, suerte: 3, imagen: UIImage(named: "hero3")))
        
    }
}

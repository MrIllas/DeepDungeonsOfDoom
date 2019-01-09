//
//  ViewController.swift
//  DeepDungeonsOfDoom
//
//  Created by Robert Recorda on 28/11/18.
//  Copyright © 2018 RobertRecordà. All rights reserved.
//

import UIKit
var charHero:[Hero]! = []
var itemList:[Item]! = []
var monsterList:[Monster]! = []

var char1Item:[Item]! = []
var char2Item:[Item]! = []
var char3Item:[Item]! = []

var selectedHero:Int = 0
var check:Int = 0
class ViewController: UIViewController {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize objects
        if check == 0{
            itemDeclaration()//Crea los items
            charItemIni() //Guarda los items iniciales de los heroes
            charDeclaration() //Crea los Heroes
            monsterDeclaration() //Creates the monster list
            check = check + 1
        }
        writeHeroList() //Crea la lista de heroes
    }
    
    
    @IBOutlet weak var btnChar1: UIButton!
    
    
    @IBOutlet weak var btnChar2: UIButton!
    @IBOutlet weak var btnChar3: UIButton!
    
    @IBOutlet weak var imgChar1: UIImageView!
    @IBOutlet weak var labelName1: UILabel!
    @IBOutlet weak var labelChar1Atq: UILabel!
    @IBOutlet weak var labelChar1Def: UILabel!
    @IBOutlet weak var labelChar1Mag: UILabel!
    @IBOutlet weak var labelChar1Lck: UILabel!
    
    
    @IBOutlet weak var imgChar2: UIImageView!
    @IBOutlet weak var labelName2: UILabel!
    @IBOutlet weak var labelChar2Atq: UILabel!
    @IBOutlet weak var labelChar2Def: UILabel!
    @IBOutlet weak var labelChar2Mag: UILabel!
    @IBOutlet weak var labelChar2Lck: UILabel!
    
    
    @IBOutlet weak var imgChar3: UIImageView!
    @IBOutlet weak var labelName3: UILabel!
    @IBOutlet weak var labelChar3Atq: UILabel!
    @IBOutlet weak var labelChar3Def: UILabel!
    @IBOutlet weak var labelChar3Mag: UILabel!
    @IBOutlet weak var labelChar3Lck: UILabel!
    
    
    var startMoney:Int! = 300
    var startExp:Int! = 0
   
    
    
    @IBAction func selChar(_ sender: AnyObject) {
        let newView = storyboard!.instantiateViewController(withIdentifier: "menu") as? Menu
        self.present(newView!, animated: true, completion: nil)
        switch sender.tag{
            case 1:
                print("0")
                selectedHero = 0
                break
            case 2:
                print("1")
                selectedHero = 1
                break
            case 3:
                print("2")
                selectedHero = 2
                break
            default:
                print("Woops!")
        }
    }
    
    func writeHeroList(){
        var xPortrait:Int = 90
        var yPortrait:Int = 295
        var xNombre:Int = 145
        var yDiferrence1 = 30
        var hp:Int = 0
        
        imgChar1.image = charHero[0].getImagen()
        labelName1.text = charHero[0].getNombre()
        labelChar1Atq.text = String(charHero[0].getAtq())
        labelChar1Def.text = String(charHero[0].getDef())
        labelChar1Mag.text = String(charHero[0].getMag())
        labelChar1Lck.text = String(charHero[0].getLck())
        
        
        imgChar2.image = charHero[1].getImagen()
        labelName2.text = charHero[1].getNombre()
        labelChar2Atq.text = String(charHero[1].getAtq())
        labelChar2Def.text = String(charHero[1].getDef())
        labelChar2Mag.text = String(charHero[1].getMag())
        labelChar2Lck.text = String(charHero[1].getLck())
        
        imgChar3.image = charHero[2].getImagen()
        labelName3.text = charHero[2].getNombre()
        labelChar3Atq.text = String(charHero[2].getAtq())
        labelChar3Def.text = String(charHero[2].getDef())
        labelChar3Mag.text = String(charHero[2].getMag())
        labelChar3Lck.text = String(charHero[2].getLck())
        
        for h in charHero{
            hp = h.getVida()
            var xCorazon:Int = 230
            for i in 0..<hp{
                var viewCorazon = UIImageView(image: UIImage(named: "heart"))
                viewCorazon.frame = CGRect(x: xCorazon, y: yPortrait, width: 20, height: 20)
                view.addSubview(viewCorazon)
                xCorazon += 22
            }
            yPortrait += 147
        }
    }
    
    func itemDeclaration(){
        //Casco
        itemList.append(Item.init(nombre: "Casco del caballero", coste: 250, ataque: 0, defensa: 7, magia: 0, suerte: 2, imagen: UIImage(named: "helmet1"), type: "head"))
        itemList.append(Item.init(nombre: "Gran casco adornado", coste: 400, ataque: 0, defensa: 9, magia: 2, suerte: 2, imagen: UIImage(named: "helmet2"), type: "head"))
        itemList.append(Item.init(nombre: "Sombreo de brujo", coste: 150, ataque: 0, defensa: 2, magia: 3, suerte: 0, imagen: UIImage(named: "helmet3"), type: "head"))
        itemList.append(Item.init(nombre: "Casco vikingo", coste: 200, ataque: 0, defensa: 5, magia: 0, suerte: 2, imagen: UIImage(named: "helmet4"), type: "head"))
        itemList.append(Item.init(nombre: "Casco del soldado", coste: 150, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "helmet5"), type: "head"))
        
        //Pechera
        itemList.append(Item.init(nombre: "Pechera de hierro", coste: 100, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "armour"), type: "chest"))
        itemList.append(Item.init(nombre: "Gran pechera de hierro", coste: 300, ataque: 0, defensa: 9, magia: 0, suerte: 0, imagen: UIImage(named: "armour2"), type: "chest"))
        itemList.append(Item.init(nombre: "Pechera de cuero", coste: 200, ataque: 0, defensa: 5, magia: 0, suerte: 0, imagen: UIImage(named: "armour3"), type: "chest"))//7
        
        //Botas
        itemList.append(Item.init(nombre: "Botas de cuero comun", coste: 100, ataque: 0, defensa: 1, magia: 0, suerte: 0, imagen: UIImage(named: "boots"), type: "boots"))
        itemList.append(Item.init(nombre: "Botas de malla comun", coste: 200, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "boots2"), type: "boots"))//9
        
        //Capa
        itemList.append(Item.init(nombre: "Capa negra", coste: 100, ataque: 0, defensa: 1, magia: 1, suerte: 0, imagen: UIImage(named: "cap"), type: "coat"))
        itemList.append(Item.init(nombre: "Capa roja", coste: 150, ataque: 0, defensa: 1, magia: 2, suerte: 0, imagen: UIImage(named: "cap2"), type: "coat"))
        itemList.append(Item.init(nombre: "Capa marron", coste: 200, ataque: 0, defensa: 2, magia: 2, suerte: 0, imagen: UIImage(named: "cap3"), type: "coat"))
        
        //Collar
        itemList.append(Item.init(nombre: "Collar de huesos", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 2, imagen: UIImage(named: "necklace"), type: "accesory"))
        
        //Anillos
        itemList.append(Item.init(nombre: "Anillo con diamante", coste: 300, ataque: 0, defensa: 0, magia: 5, suerte: 4, imagen: UIImage(named: "ring"), type: "accesory"))
        itemList.append(Item.init(nombre: "Anillo de oro", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 1, imagen: UIImage(named: "ring2"), type: "accesory"))//15
        
        //Espadas
        itemList.append(Item.init(nombre: "Espada de madera", coste: 100, ataque: 1, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword4"), type: "weapon"))
        itemList.append(Item.init(nombre: "Espada de hierro", coste: 150, ataque: 2, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword1"), type: "weapon"))
        itemList.append(Item.init(nombre: "Espada de fuego", coste: 250, ataque: 5, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "sword2"), type: "weapon"))
        itemList.append(Item.init(nombre: "Espada divina", coste: 500, ataque: 10, defensa: 0, magia: 0, suerte: 4, imagen: UIImage(named: "sword3"), type: "weapon"))
        
        //Arco
        itemList.append(Item.init(nombre: "Arco comun", coste: 100, ataque: 3, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow"), type: "weapon"))
        itemList.append(Item.init(nombre: "Arco del soldado", coste: 200, ataque: 5, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow2"), type: "weapon"))
        itemList.append(Item.init(nombre: "Gran arco", coste: 300, ataque: 9, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "arrow3"), type: "weapon"))
        
        //Cetro
        itemList.append(Item.init(nombre: "Cetro de oro", coste: 200, ataque: 2, defensa: 0, magia: 4, suerte: 0, imagen: UIImage(named: "scepter"), type: "weapon"))
        itemList.append(Item.init(nombre: "Cetro de diamante", coste: 500, ataque: 5, defensa: 0, magia: 10, suerte: 2, imagen: UIImage(named: "scepter2"), type: "weapon"))
        itemList.append(Item.init(nombre: "Cetro comun", coste: 100, ataque: 1, defensa: 0, magia: 2, suerte: 0, imagen: UIImage(named: "scepter3"), type: "weapon"))
        
        //Escudos
        itemList.append(Item.init(nombre: "Escudo de hierro", coste: 100, ataque: 0, defensa: 5, magia: 0, suerte: 0, imagen: UIImage(named: "shield"), type: "shield"))
        itemList.append(Item.init(nombre: "Escudo de avenzo", coste: 200, ataque: 0, defensa: 7, magia: 0, suerte: 0, imagen: UIImage(named: "shield2"), type: "shield"))
        itemList.append(Item.init(nombre: "Escudo de espejos", coste: 300, ataque: 0, defensa: 5, magia: 3, suerte: 0, imagen: UIImage(named: "shield3"), type: "shield"))
        itemList.append(Item.init(nombre: "Escudo de madera", coste: 50, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "shield4"), type: "shield"))
        
        //Pociones
        itemList.append(Item.init(nombre: "Poción pequeña de sanación", coste: 50, ataque: 0, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "potion2"), type: "potion"))
        
        //itemList.append(Item.init(nombre: "Gran poción de sanación", coste: 100, ataque: 0, defensa: 0, magia: 0, suerte: 0, imagen: UIImage(named: "potion"), type: "potion"))
 }
    func monsterDeclaration(){
        monsterList.append(Monster.init(name: "Golem", atq: 10, health: 4, exp: 9, money: 50, image: UIImage(named: "monster1")!))
        monsterList.append(Monster.init(name: "Trent", atq: 25, health: 6, exp: 9, money: 70, image: UIImage(named: "monster2")!))
        monsterList.append(Monster.init(name: "Rat", atq: 26, health: 2, exp: 4, money: 100, image: UIImage(named: "monster3")!))
    }
    func charItemIni(){
        char1Item.append(itemList[4])//Casco
        char1Item.append(itemList[7])//Pecho
        char1Item.append(itemList[8])//Botas
        char1Item.append(itemList[15])//Anillo
        char1Item.append(itemList[16])//Espada
        char1Item.append(itemList[29])//Escudo
        
        char2Item.append(itemList[4])//Casco
        char2Item.append(itemList[7])//Pecho
        char2Item.append(itemList[8])//Botas
        char2Item.append(itemList[15])//Anillo
        char2Item.append(itemList[16])//Espada
        char2Item.append(itemList[29])//Escudo
        
        char3Item.append(itemList[4])//Casco
        char3Item.append(itemList[7])//Pecho
        char3Item.append(itemList[8])//Botas
        char3Item.append(itemList[15])//Anillo
        char3Item.append(itemList[16])//Espada
        char3Item.append(itemList[29])//Escudo
    }
    
    func charDeclaration(){
        charHero.append(Hero.init(vida: 4, nombre: "Soldier66", dinero: startMoney, exp: startExp, Stuff: char1Item, ataque: 3, defensa: 4, magia: 1, suerte: 3, imagen: UIImage(named: "heroe1")))
        charHero.append(Hero.init(vida: 3, nombre: "Ashe", dinero: startMoney, exp: startExp, Stuff: char2Item, ataque: 5, defensa: 5, magia: 0, suerte: 8, imagen: UIImage(named: "heroe2")))
        charHero.append(Hero.init(vida: 2, nombre: "Kel'thuzad", dinero: startMoney, exp: startExp, Stuff: char3Item, ataque: 4, defensa: 3, magia: 8, suerte: 3, imagen: UIImage(named: "heroe3")))
        
    }
}

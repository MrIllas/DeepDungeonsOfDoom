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


var char1Item:[Item]! = []
var char2Item:[Item]! = []
var char3Item:[Item]! = []

var selectedHero:Int = 0
class ViewController: UIViewController {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize objects
        
        itemDeclaration()//Crea los items
        charItemIni() //Guarda los items iniciales de los heroes
        charDeclaration() //Crea los Heroes
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
        
            /*//Portrait
            var imagePortrait = h.getImagen()
            var imageViewPortrait = UIImageView(image: imagePortrait)
            imageViewPortrait.frame = CGRect(x: xPortrait, y: yPortrait, width: 50, height: 70)
            view.addSubview(imageViewPortrait)
            //yPortrait += 147
            */
            //HP
            hp = h.getVida()
            var xCorazon:Int = 230
            for i in 0..<hp{
                var viewCorazon = UIImageView(image: UIImage(named: "heart"))
                viewCorazon.frame = CGRect(x: xCorazon, y: yPortrait, width: 20, height: 20)
                view.addSubview(viewCorazon)
                xCorazon += 22
                
            }
            yPortrait += 147
            /*
            
            
            //Stats
            
                //name
            var name = UILabel(frame: CGRect(x: xNombre, y: yPortrait, width: 200, height: 21))
            name.text = h.getNombre()
            name.font = UIFont(name: "Halvetica", size: 12)
            name.textColor = UIColor.white
            view.addSubview(name)
                //Atq
            var atqName = UILabel(frame: CGRect(x: xNombre, y: yPortrait+yDiferrence1, width: 200, height: 21))
            atqName.font = UIFont.systemFont(ofSize: 10)
            atqName.text = "ATQ"
            
            atqName.textColor = UIColor.white
            view.addSubview(atqName)
            var imageAtq = UIImageView(image: UIImage(named: "damage"))
            imageAtq.frame = CGRect(x: xNombre+22, y: yPortrait+yDiferrence1, width: 20, height: 20)
            view.addSubview(imageAtq)
            
            /*var atqName = UILabel(frame: CGRect(x: xNombre, y: yPortrait+yDiferrence1, width: 200, height: 21))
            atqName.font = UIFont.systemFont(ofSize: 10)
            atqName.text = "ATQ"*/
            
            atqName.textColor = UIColor.white
            view.addSubview(atqName)
                //DEF
            yPortrait += 147
 */
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
        itemList.append(Item.init(nombre: "Pechera de cuero", coste: 200, ataque: 0, defensa: 5, magia: 0, suerte: 0, imagen: UIImage(named: "armour3")))//7
        
        //Botas
        itemList.append(Item.init(nombre: "Botas de cuero comun", coste: 100, ataque: 0, defensa: 1, magia: 0, suerte: 0, imagen: UIImage(named: "boots")))
        itemList.append(Item.init(nombre: "Botas de malla comun", coste: 200, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: UIImage(named: "boots2")))//9
        
        //Capa
        itemList.append(Item.init(nombre: "Capa negra", coste: 100, ataque: 0, defensa: 1, magia: 1, suerte: 0, imagen: UIImage(named: "cap")))
        itemList.append(Item.init(nombre: "Capa roja", coste: 150, ataque: 0, defensa: 1, magia: 2, suerte: 0, imagen: UIImage(named: "cap2")))
        itemList.append(Item.init(nombre: "Capa marron", coste: 200, ataque: 0, defensa: 2, magia: 2, suerte: 0, imagen: UIImage(named: "cap3")))
        
        //Collar
        itemList.append(Item.init(nombre: "Collar de huesos", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 2, imagen: UIImage(named: "necklace")))
        
        //Anillos
        itemList.append(Item.init(nombre: "Anillo con diamante", coste: 300, ataque: 0, defensa: 0, magia: 5, suerte: 4, imagen: UIImage(named: "ring")))
        itemList.append(Item.init(nombre: "Anillo de oro", coste: 200, ataque: 0, defensa: 0, magia: 3, suerte: 1, imagen: UIImage(named: "ring2")))//15
        
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

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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var btnChar1: UIButton!
    @IBOutlet weak var btnChar2: UIButton!
    @IBOutlet weak var btnChar3: UIButton!
    
    var charHero:[Hero]!
    var itemList:[Item]!
    var startMoney:Int! = 0
    var startExp:Int! = 0
    
    var char1Item:[Item]!
    
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
        itemList.append(Item.init(nombre: "Casco", coste: 100, ataque: 0, defensa: 3, magia: 0, suerte: 0, imagen: ""))

    }
    func charDeclaration(){
        charHero.append(Hero.init(vida: 4, nombre: "Soldier", dinero: startMoney, exp: startExp, Stuff: char1Item, ataque: 3, defensa: 9, magia: 1, suerte: 5, imagen: ""))
    }
}

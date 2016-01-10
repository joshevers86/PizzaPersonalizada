//
//  MostrarPizza.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 8/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class MostrarPizza: UIViewController {

    @IBOutlet weak var tPizza: UILabel!
    var tamPizza: String = ""
    
    @IBOutlet weak var tMasa: UILabel!
    var tipMasa:String = ""
    
    @IBOutlet weak var tQueso: UILabel!
    var tipQueso:String = ""
    
  
    
    @IBOutlet weak var tIngredientes: UITextView!
    var ingredientes:[String] = [String]()
    var ingr:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tPizza.text=tamPizza
        tMasa.text=tipMasa
        tQueso.text=tipQueso
        for ls in ingredientes{
            ingr = ingr + "\(ls) \n"
        }
        
        tIngredientes.text = ingr
    }
    
    
    @IBAction func validarConfirmación(sender: AnyObject) {
        if ((tPizza.text?.isEmpty) == true) || ((tMasa.text?.isEmpty) == true) || ((tQueso.text?.isEmpty) == true) || (tIngredientes.text.isEmpty == true){
            
            
            let mensaje = "Revisa los campos de seleccion de la pizza"
            let alert = UIAlertController()
            alert.title = "Pizza mal configurada"
            alert.message = mensaje
            alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Default,handler: nil))
            presentViewController(alert, animated: true , completion: nil)
            
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

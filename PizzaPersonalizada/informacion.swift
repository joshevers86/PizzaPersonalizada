//
//  informacion.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 10/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class informacion: UIViewController {

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for ls in ingredientes{
            ingr = ingr + "\(ls) \n"
        }
        
        tIngredientes.text = ingr
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

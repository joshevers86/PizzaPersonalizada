//
//  TipoQueso.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 8/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class TipoQueso: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var selTipoQues: UIPickerView!
    @IBOutlet weak var mosTipoQues: UILabel!
    var tipoQueso = ["Mozzarella", "Cheddar", "Parmesano", "Sin queso"]
    var tamPizza: String = ""
    var tipMasa:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selTipoQues.dataSource=self
        self.selTipoQues.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 // its for components that showing in your pickerview
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return tipoQueso.count // its for showing number of row in per component
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoQueso[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosTipoQues.text = tipoQueso[row]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! SelIngredientes
        sigVista.tipQueso = mosTipoQues.text!
        sigVista.tipMasa = tipMasa
        sigVista.tamPizza = tamPizza
        
    }
    


}

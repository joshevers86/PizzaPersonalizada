//
//  TipoMasa.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 8/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class TipoMasa: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var selTipMasa: UIPickerView!
    @IBOutlet weak var mosTipMasa: UILabel!
    var tiposMasa = ["Delgada", "Crujiente", "Gruesa"]
    var tamPizza: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selTipMasa.delegate = self
        self.selTipMasa.dataSource = self
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
        return tiposMasa.count // its for showing number of row in per component
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposMasa[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosTipMasa.text = tiposMasa[row]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! TipoQueso
        sigVista.tipMasa = mosTipMasa.text!
        sigVista.tamPizza = tamPizza
    }


}

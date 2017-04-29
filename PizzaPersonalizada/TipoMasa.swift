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
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // its for components that showing in your pickerview
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return tiposMasa.count // its for showing number of row in per component
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposMasa[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosTipMasa.text = tiposMasa[row]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mosTipMasa.text = tiposMasa[self.selTipMasa.selectedRow(inComponent: 0)]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sigVista = segue.destination as! TipoQueso
        sigVista.tipMasa = mosTipMasa.text!
        sigVista.tamPizza = tamPizza
    }


}

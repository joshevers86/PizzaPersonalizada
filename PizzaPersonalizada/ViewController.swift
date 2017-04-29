//
//  ViewController.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 8/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var selPizza: UIPickerView!
    @IBOutlet weak var mosSelPizza: UILabel!
    var tiposPizzas:[String] = ["Peqeña", "Mediana", "Grande"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.selPizza.showsSelectionIndicator = true
        self.selPizza.delegate = self
        self.selPizza.dataSource = self
        
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
        return tiposPizzas.count // its for showing number of row in per component
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposPizzas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosSelPizza.text = tiposPizzas[row]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mosSelPizza.text = tiposPizzas[self.selPizza.selectedRow(inComponent: 0)]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sel = mosSelPizza.text!
        let sigVista = segue.destination as! TipoMasa
        sigVista.tamPizza = sel
    }



}


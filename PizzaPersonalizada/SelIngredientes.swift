//
//  SelIngredientes.swift
//  PizzaPersonalizada
//
//  Created by Jose Navarro Alabarta on 8/1/16.
//  Copyright © 2016 Jose Navarro Alabarta. All rights reserved.
//

import UIKit

class SelIngredientes: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var mosIngred: UILabel!
    @IBOutlet weak var selIngrediente: UIPickerView!

    var listaSeleccionada : [String] = []
    var ingredientes = ["Jamón", "Pepperoni", "Pavo","Salchicha","Aceituna","Cebolla","Pimiento","Piña","Anchoas","Alcaparras"]
    
    var tamPizza: String = ""
    var tipMasa:String = ""
    var tipQueso:String = ""
    
    @IBOutlet weak var numSelIngredientes: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selIngrediente.delegate=self
        self.selIngrediente.dataSource=self
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
        return ingredientes.count // its for showing number of row in per component
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredientes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosIngred.text = ingredientes[row]
        
    }
    
    
    @IBAction func anyadirIngrediente(_ sender: AnyObject) {
        addIngrediente()
    }
func addIngrediente(){
    if (listaSeleccionada.count < 5){
        numSelIngredientes.text = "Nº Ingredientes selecionados \(listaSeleccionada.count+1)"
        listaSeleccionada.append(mosIngred.text!)
    }
    
    
}

    @IBAction func mostrarIngredientes(_ sender: AnyObject) {
        imprimirIngedientes()
    }
    func imprimirIngedientes(){
        var mensaje = ""
        for ls in listaSeleccionada {
            mensaje = mensaje + "\n\(ls)"
            print("\(ls)")
        }
        let alertController = UIAlertController(title: "Ingredientes seleccionados:", message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    

    
    @IBAction func eliminarIngrediente(_ sender: AnyObject) {
        delIngrediente()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resu = listaSeleccionada
       
        let sigVista = segue.destination as! MostrarPizza
        sigVista.ingredientes=resu
        sigVista.tipQueso = tipQueso
        sigVista.tipMasa = tipMasa
        sigVista.tamPizza = tamPizza
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mosIngred.text = ingredientes[self.selIngrediente.selectedRow(inComponent: 0)]
        numSelIngredientes.text = "Nº Ingredientes selecionados 0"
    }
    
    //elimina elemento del vector segun su posicion
    func delIngrediente(){
        if (!listaSeleccionada.isEmpty){
            var contar = 0
            for ls in listaSeleccionada{
                if ls == mosIngred.text! {
                    listaSeleccionada.remove(at: contar)
                    break
                }
                contar = contar + 1
            }
            /*if listaSeleccionada.count == 0 {
                numSelIngredientes.text = "Nº Ingredientes selecionados \(listaSeleccionada.count)"
            }else{*/
            numSelIngredientes.text = "Nº Ingredientes selecionados \(listaSeleccionada.count)"
            //}
        }

    }
}

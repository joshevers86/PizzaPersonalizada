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
    
    
    


    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 // its for components that showing in your pickerview
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return ingredientes.count // its for showing number of row in per component
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredientes[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        mosIngred.text = ingredientes[row]
        
    }
    
    
    @IBAction func anyadirIngrediente(sender: AnyObject) {
        addIngrediente()
    }
func addIngrediente(){
    if (listaSeleccionada.count < 5){
        numSelIngredientes.text = "Nº Ingredientes selecionados \(listaSeleccionada.count+1)"
        listaSeleccionada.append(mosIngred.text!)
    }
    
    
}

    @IBAction func mostrarIngredientes(sender: AnyObject) {
        imprimirIngedientes()
    }
    func imprimirIngedientes(){
        var mensaje = ""
        for ls in listaSeleccionada {
            mensaje = mensaje + "\n\(ls)"
            print("\(ls)")
        }
        let alertController = UIAlertController(title: "Ingredientes seleccionados:", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    

    
    @IBAction func eliminarIngrediente(sender: AnyObject) {
        delIngrediente()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resu = listaSeleccionada
       
        let sigVista = segue.destinationViewController as! MostrarPizza
        sigVista.ingredientes=resu
        sigVista.tipQueso = tipQueso
        sigVista.tipMasa = tipMasa
        sigVista.tamPizza = tamPizza
    
        
    }
    
    override func viewWillAppear(animated: Bool) {
        mosIngred.text = ingredientes[self.selIngrediente.selectedRowInComponent(0)]
        numSelIngredientes.text = "Nº Ingredientes selecionados 0"
    }
    
    //elimina elemento del vector segun su posicion
    func delIngrediente(){
        if (!listaSeleccionada.isEmpty){
            var contar = 0
            for ls in listaSeleccionada{
                if ls == mosIngred.text! {
                    listaSeleccionada.removeAtIndex(contar)
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

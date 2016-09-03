//
//  ICIngredientesClass.swift
//  PizzaAppAW
//
//  Created by Jesus Manuel Porras on 9/2/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import WatchKit
import Foundation


class ICIngredientesClass: WKInterfaceController {

    //-------------------vars-------------------------------
    var ingredientesArr:[String] = []
    var Orden = Pizza()
    var indice: Int = 0
    
    //-------------awakeWithContext------------------
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        Orden = context as! Pizza //va a ser de una clase tipo Pizza
    }
    
    //------------funciones---------------------------
    func mensaje(encabezado encabezado: String, mensaje: String){
        let h0 = { print("ok")}
        let action1 = WKAlertAction(title: "Aceptar", style: .Default, handler:h0)
        presentAlertControllerWithTitle(encabezado, message: mensaje, preferredStyle: .ActionSheet, actions: [action1])
    }
    
    func pasaDe5(val: Bool) -> Bool{
        if ((ingredientesArr.count == 5)&&(val)){
            mensaje(encabezado: "Solo hasta 5 ingredientes", mensaje: "")
            return true
        }
        return false
    }
    
    //------------------Outlets y actions-----------------

    @IBOutlet var oswJamon: WKInterfaceSwitch!
    @IBAction func swJamon(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
                oswJamon.setOn(false)
        } else {
            if(value){ ingredientesArr.append("Jamon") }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Jamon"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswPepperoni: WKInterfaceSwitch!
    @IBAction func swPepperoni(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
            oswPepperoni.setOn(false)
        } else {
            if(value){ ingredientesArr.append("Pepperoni") }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Pepperoni"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswChorizo: WKInterfaceSwitch!
    @IBAction func swChorizo(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
            oswChorizo.setOn(false)
        } else {
            if(value){
                ingredientesArr.append("Chorizo")
            }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Chorizo"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswPina: WKInterfaceSwitch!
    @IBAction func swPina(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
            oswPina.setOn(false)
        } else {
            if(value){
                ingredientesArr.append("Pina")
            }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Pina"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswSalchicha: WKInterfaceSwitch!
    @IBAction func swSalchicha(value: Bool) {
        if ((pasaDe5(value))&&(value)) { oswSalchicha.setOn(false) } else {
            if(value){
                ingredientesArr.append("Salchicha")
            }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Salchicha"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswPavo: WKInterfaceSwitch!
    @IBAction func swPavo(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
            oswPavo.setOn(false)
        } else {
            if(value){
                ingredientesArr.append("Pavo")
            }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Pavo"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    
    @IBOutlet var oswAnchoas: WKInterfaceSwitch!
    @IBAction func swAnchoas(value: Bool) {
        if ((pasaDe5(value))&&(value)) {
            oswAnchoas.setOn(false)
        } else {
            if(value){ ingredientesArr.append("Anchoas") }
            else{
                ingredientesArr = ingredientesArr.filter(){ $0 != "Anchoas"} //filtramos lo que no tenga X
            }
        }
        dump(ingredientesArr)
    }
    
    //------------Siguiente Action--------------
    
    @IBAction func siguienteAction() {
        if (ingredientesArr.count == 0) {
            mensaje(encabezado: "Selecciona al menos un ingrediente", mensaje: "")
            
        } else {
        Orden.ingrediente1 = "Nada"
        Orden.ingrediente2 = "Nada"
        Orden.ingrediente3 = "Nada"
        Orden.ingrediente4 = "Nada"
        Orden.ingrediente5 = "Nada"
        Orden.ingrediente1 = ingredientesArr[0]
        if (ingredientesArr.count == 2) { Orden.ingrediente2 = ingredientesArr[1]}
            if (ingredientesArr.count == 3) { Orden.ingrediente2 = ingredientesArr[1]; Orden.ingrediente3 = ingredientesArr[2]}
            if (ingredientesArr.count == 4) { Orden.ingrediente2 = ingredientesArr[1]; Orden.ingrediente3 = ingredientesArr[2]; Orden.ingrediente4 = ingredientesArr[3]}
            if (ingredientesArr.count == 5) {Orden.ingrediente2 = ingredientesArr[1]; Orden.ingrediente3 = ingredientesArr[2]; Orden.ingrediente4 = ingredientesArr[3]; Orden.ingrediente5 = ingredientesArr[4]}
                pushControllerWithName("ICConfirmacion", context: Orden)
        }
    }
    
    
    // -----------------------------------------

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

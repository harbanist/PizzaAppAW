//
//  ICQuesoClass.swift
//  PizzaAppAW
//
//  Created by Jesus Manuel Porras on 9/2/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import WatchKit
import Foundation


class ICQuesoClass: WKInterfaceController {

    //-------------------vars-------------------------------
    let quesos: [(String,String)] = [("Sin queso", "Sin queso"),("Mozarela", "Mozarela"), ("Cheddar", "Cheddar"), ("Parmesano", "Parmesano")] //caption, title
    var quesoSeleccionado = "Sin queso"
    var pickerItems:[WKPickerItem]?
    var Orden = Pizza()
    
    
    
    
    //--------------------awakeWithContext------------------
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        Orden = context as! Pizza //va a ser de una clase tipo Pizza
        
        
        pickerItems = quesos.map(){
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        piQueso.setItems(pickerItems)
    }
    
    //------------------Outlets y actions-----------------
    
    @IBOutlet var piQueso: WKInterfacePicker!
    
    
    @IBAction func piQuesoAction(value: Int) {
        if (Orden.tipoQueso == "Ninguno") { Orden.tipoQueso = quesoSeleccionado }
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            Orden.tipoQueso = pickedItem.title!
        }
        
    }
    
    
    //------------Siguiente Action--------------
    
    
    @IBAction func siguienteAccion() {
        if (Orden.tipoQueso == "Ninguno") { Orden.tipoQueso = quesoSeleccionado }
        print("Objeto (En queso):\(Orden.tamano), \(Orden.tipoMasa), \(Orden.tipoQueso)")
        pushControllerWithName("ICIngredientes", context: Orden)
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

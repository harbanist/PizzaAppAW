//
//  ICMasaClass.swift
//  PizzaAppAW
//
//  Created by Jesus Manuel Porras on 9/1/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import WatchKit
import Foundation


class ICMasaClass: WKInterfaceController {
    
    
    
    //-------------------vars-------------------------------
    let masas: [(String,String)] = [("Delgada", "Delgada"), ("Crujiente", "Crujiente"), ("Gruesa", "Gruesa")] //caption, title
    var masaSeleccionado = "Delgada"
    var pickerItems:[WKPickerItem]?
    var Orden = Pizza()
    
    
   
    
    //--------------------awakeWithContext------------------
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        Orden = context as! Pizza //va a ser de una clase tipo Pizza
        
        
        pickerItems = masas.map(){
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        piMasa.setItems(pickerItems)
        print("Desde awake masa: \(Orden.tamano)")
    }
    
    //------------------Outlets y actions-----------------
    @IBOutlet var piMasa: WKInterfacePicker!
    
    @IBAction func piMasaAction(value: Int) {
        print("Desde action masa: \(Orden.tamano)")
        if (Orden.tipoMasa == "Ninguno") { Orden.tipoMasa = masaSeleccionado }
        
        // NSLog("List Picker: \(tamanoList[value].0) selected")
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            Orden.tipoMasa = pickedItem.title!
        }
        
    }

    
    //------------Siguiente Action--------------
    
    @IBAction func siguienteAction() {
        
        if (Orden.tipoMasa == "Ninguno") { Orden.tipoMasa = masaSeleccionado }
        print("Objeto (En masa):\(Orden.tamano), \(Orden.tipoMasa)")
        pushControllerWithName("ICQueso", context: Orden)
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


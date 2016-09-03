//
//  ICTamanoClass.swift
//  PizzaAppAW
//
//  Created by Jesus Manuel Porras on 8/31/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import WatchKit
import Foundation


class ICTamanoClass: WKInterfaceController {
    
    //------------------Outlets y actions-----------------
    @IBOutlet var piTamano: WKInterfacePicker!
    
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        
        if (Orden.tamano == "Ninguno") { Orden.tamano = tamanoSeleccionado }
        
        // NSLog("List Picker: \(tamanoList[value].0) selected")
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            Orden.tamano = pickedItem.title!
        }
        print("Objeto(En tamaño):\(Orden.tamano), ", terminator: "\n")
    }
   
    //-------------------vars-------------------------------
    let tamanos: [(String,String)] = [("Chica", "Chica"), ("Mediana", "Mediana"), ("Grande", "Grande")] //caption, title
    var tamanoSeleccionado = "Chica"
    var resultado:[String] = []
    var pickerItems:[WKPickerItem]?
    let Orden = Pizza()
    
    //--------------------awakeWithContext------------------
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pickerItems = tamanos.map(){
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            //print("Caption: \(pickerItem.caption), title: \(pickerItem.title)")
            return pickerItem
        }
        piTamano.setItems(pickerItems)
    }
    
    //------------Siguiente Action--------------
    
    @IBAction func siguienteAction() {
        if (Orden.tamano == "Ninguno") { Orden.tamano = tamanoSeleccionado }
        pushControllerWithName("ICMasa", context: Orden)
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

//
//  ICConfirmacionClass.swift
//  PizzaAppAW
//
//  Created by Jesus Manuel Porras on 9/2/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import WatchKit
import Foundation


class ICConfirmacionClass: WKInterfaceController {

    //-------------------vars-------------------------------
    var Orden = Pizza()

    
    //--------------------awakeWithContext------------------
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        Orden = context as! Pizza //va a ser de una clase tipo Pizza
        var cadIngredientes: String = ""
        cadIngredientes += Orden.ingrediente1
        if (Orden.ingrediente2 != "Nada") { cadIngredientes += ", " + Orden.ingrediente2 }
        if (Orden.ingrediente3 != "Nada") { cadIngredientes += ", " + Orden.ingrediente3 }
        if (Orden.ingrediente4 != "Nada") { cadIngredientes += ", " + Orden.ingrediente4 }
        if (Orden.ingrediente5 != "Nada") { cadIngredientes += ", " + Orden.ingrediente5 }
        txtConfirmacion.setText("-Pizza: \(Orden.tamano)\n-Masa: \(Orden.tipoMasa)\n-Queso: \(Orden.tipoQueso)\n-Ingredientes: \(cadIngredientes).")
        print("Pizza: \(Orden.tamano)\nMASA: \(Orden.tipoMasa)\nQUESO: \(Orden.tipoQueso)\nINGREDIENTES: \(cadIngredientes).")
       /*
        print ("Ingrediente1: \(Orden.ingrediente1)")
        print ("Ingrediente2: \(Orden.ingrediente2)")
        print ("Ingrediente3: \(Orden.ingrediente3)")
        print ("Ingrediente4: \(Orden.ingrediente4)")
        print ("Ingrediente5: \(Orden.ingrediente5)")*/
            }
    
    //------------------Outlets y actions-----------------
    @IBOutlet var txtConfirmacion: WKInterfaceLabel!    
    
       // -----------------------------------------
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

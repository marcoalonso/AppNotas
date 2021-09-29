//
//  ViewController.swift
//  NotasApp
//
//  Created by marco rodriguez on 29/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let notas =   ["Ir al cine", "Leer", "Hacer tarea","Ver serie"]

    @IBOutlet weak var tablaNotas: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addNotaBtn(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nueva Nota", message: "Agregar", preferredStyle: .alert)
        
        //let accionAceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        let accionOk = UIAlertAction(title: "OK", style: .default) { _ in
            print("Nota Agregada")
            //self.notas.append("Nueva Nota Agregada")
            //self.tablaNotas.reloadData()
        }
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alerta.addAction(accionOk)
        alerta.addAction(accionCancelar)
        
        present(alerta, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaNotas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = "Ir al cine"
        celda.detailTextLabel?.text = "6:00 p.m."
        return celda
    }

}


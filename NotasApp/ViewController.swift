//
//  ViewController.swift
//  NotasApp
//
//  Created by marco rodriguez on 29/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var notas =  ["Ir al cine", "Leer", "Hacer tarea","Ver serie"]

    @IBOutlet weak var tablaNotas: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tablaNotas.delegate = self
        //tablaNotas.dataSource = self
    }

    @IBAction func addNotaBtn(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nueva Nota", message: "Agregar", preferredStyle: .alert)
        
        //Agregar el campo de texto
        alerta.addTextField { (nombreAlerta) in
            nombreAlerta.placeholder = "Escribe tu texto aqui"
        }
        
        alerta.addTextField { (horaAlerta) in
            horaAlerta.placeholder = "escribe un horario"
        }
        
        //let accionAceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        let accionOk = UIAlertAction(title: "OK", style: .default) { _ in
            print("Nota Agregada")
            
            
            guard let notaAlerta = alerta.textFields?.first!.text else { return }
            guard let horaAlerta = alerta.textFields?[1].text else { return }
            
            print(horaAlerta)
            
            self.notas.append(notaAlerta)
            
            print(self.notas)
            
            self.tablaNotas.reloadData()
            
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
        celda.textLabel?.text = notas[indexPath.row]
        celda.detailTextLabel?.text = notas[indexPath.row]
        return celda
    }

}


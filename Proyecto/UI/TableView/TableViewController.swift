//
//  TableViewController.swift
//  Proyecto
//
//  Created by Alejandro Rodríguez Cañete on 7/6/23.
//

import UIKit

struct CustomItem {
    let image: UIImage
    let text: String
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
//    let singleRows = ["Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo"]
    
    let customRows = [
        CustomItem(image: UIImage(systemName: "pencil.circle")!, text: "Lunes"),
        CustomItem(image: UIImage(systemName: "trash.circle")!, text: "Martes"),
        CustomItem(image: UIImage(systemName: "folder.circle")!, text: "Miércoles"),
        CustomItem(image: UIImage(systemName: "paperplane.circle")!, text: "Jueves"),
        CustomItem(image: UIImage(systemName: "doc.circle")!, text: "Viernes"),
        CustomItem(image: UIImage(systemName: "terminal")!, text: "Sábado"),
        CustomItem(image: UIImage(systemName: "book.closed")!, text: "Domingo"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Identificado de la tableviewcell de xCODE por defecto
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")
    }

    // Delegate & DataSource Methods
    
    // Esta función devuelve el numero total de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Devuelve el número de datos del array
        return customRows.count
    }
    
    // Esta función le pinta datos a las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Le damos formato a la celda para pintarle datos
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        // Elegimos el elemento del array dependiendo del indexPath
//        let weekDayName = singleRows[indexPath.row]
//        // Pintamos el nombre de la celda
//        cell.textLabel?.text = weekDayName
//        // Devolvemos la celda
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let customItem = customRows[indexPath.row]
        cell.iconImageView.image = customItem.image
        cell.titleLabel.text = customItem.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

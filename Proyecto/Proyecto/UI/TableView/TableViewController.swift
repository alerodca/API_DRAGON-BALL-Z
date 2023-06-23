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
    
    var heroes: [Heroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Heroes"
        
        // Identificado de la tableviewcell de xCODE por defecto
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")
        
        let token = LocalDataLayer.shared.getToken()
        NetworkLayer.shared.fetchHeroes(token: token) { [weak self] allHeroes, error in
            guard let self = self else { return } // avoiding retain cycle
            
            if let allHeroes = allHeroes {
                self.heroes = allHeroes
                LocalDataLayer.shared.save(heroes: allHeroes)
                
                NotificationCenter.default.post(Notification(name: Notification.Name("fetchHeroes")))
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Error fetching heroes: ", error?.localizedDescription ?? "")
            }
        }
    }

    // Delegate & DataSource Methods
    
    // Esta función devuelve el numero total de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Devuelve el número de datos del array
        return heroes.count
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
        let heroe = heroes[indexPath.row]
        cell.iconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        cell.descLabel.text = heroe.description
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let detailsView = DetailsViewController()
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
    }
}

extension UIImageView {
    
    func setImage(url: String) {
        guard let url = URL(string: url) else { return }
        
        downloadImage(url: url) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    private func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
    
}

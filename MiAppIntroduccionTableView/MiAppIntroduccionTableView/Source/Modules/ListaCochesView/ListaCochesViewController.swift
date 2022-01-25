//
//  ListaCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 24/1/22.
//

import UIKit

class ListaCochesViewController: UIViewController {

    //MARK: - Variables globales
    let dataSourceMeses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    
    //MARK: - IBOutlets
    @IBOutlet weak var miMesesAnioTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Utils.Constants().tituloListaMeses
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }

    //MARK: - Private Methods
    private func configuracionTableView() {
        self.miMesesAnioTableView.delegate = self
        self.miMesesAnioTableView.dataSource = self
        self.miMesesAnioTableView.register(UINib(nibName: MesesCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: MesesCell.defaultReuseIdentifier)
    }
}

extension ListaCochesViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceMeses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMeses = self.miMesesAnioTableView.dequeueReusableCell(withIdentifier: MesesCell.defaultReuseIdentifier, for: indexPath) as! MesesCell
        //cellMeses.miNombreMesLBL.text = self.dataSourceMeses[indexPath.row]
        cellMeses.setupCell(model: self.dataSourceMeses[indexPath.row])
        return cellMeses
        
    }
}

extension ListaCochesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, hightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

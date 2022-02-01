//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 1/2/22.
//

import UIKit

class DetalleContactoViewController: UIViewController {
    
    //MARK: - Variables Globales
    var dataModel: ArrayContact?
    
    //MARK: - IBOutlets
    @IBOutlet weak var detalleContactoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
    }


    private func configuracionTableView() {
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }

}

extension DetalleContactoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleContactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        if let modelData = self.dataModel {
            cell.configuracionCell(data: modelData)
        }
        return cell
    }
}

extension DetalleContactoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//
//  CategoriaViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

protocol CategoriaViewControllerDelegate: AnyObject {
    func nombreCategoriaSeleccionada(categoria: String)
}

class CategoriaViewController: UIViewController {

    //MARK: - Variables Globales
    var nombreCategoriaSeleccionada = ""
    var seleccionIndexPath = IndexPath()
    let dataSourceCategorias = ["Sin Categoria", "Tienda de Apple", "Bar con los amigos", "En la libreria", "En el Corte Ingles", "En el Mercadona", "En Casa", "En el Parque", "Peluqueria", "En el Trabajo"]
    
    weak var delegate: CategoriaViewControllerDelegate?
    
    //MARK: - IBoutlets
    @IBOutlet weak var categoriaTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDataSource()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    private func setupDataSource() {
        for index in 0..<dataSourceCategorias.count{
            if self.dataSourceCategorias[index] == self.nombreCategoriaSeleccionada{
                self.seleccionIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }
    
    private func configuracionTV() {
        self.categoriaTableView.delegate = self
        self.categoriaTableView.dataSource = self
        self.categoriaTableView.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }
}

extension CategoriaViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriaTableView.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cell.nombreCategoriaLBL.text = self.dataSourceCategorias[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath != self.seleccionIndexPath {
            self.seleccionIndexPath = indexPath
            self.nombreCategoriaSeleccionada = dataSourceCategorias[indexPath.row]
            self.delegate?.nombreCategoriaSeleccionada(categoria: self.nombreCategoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

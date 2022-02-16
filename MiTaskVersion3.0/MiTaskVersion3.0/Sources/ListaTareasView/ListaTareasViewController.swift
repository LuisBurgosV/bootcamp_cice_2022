//
//  ListaTareasViewController.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

class ListaTareasViewController: UIViewController {

    //MARK: - Variables globales
    var dataSourceTareas: [DownloadNewModel] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var listaTareasTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal { results in
            if let resultsUnw = results {
                self.dataSourceTareas = resultsUnw.downloads ?? []
                self.listaTareasTableView.reloadData()
            }
        } failure: { error in
            debugPrint(error?.debugDescription ?? "Metiste Gamba")
        }
    }
    
    private func configuracionTV() {
        self.listaTareasTableView.delegate = self
        self.listaTareasTableView.dataSource = self
        self.listaTareasTableView.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }
}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceTareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listaTareasTableView.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cell.nombreCategoriaLBL.text = self.dataSourceTareas[indexPath.row].newTask
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//
//  NavigationViewController.swift
//  MiAppAlertas
//
//  Created by Luis Burgos on 20/1/22.
//

import UIKit

class NavigationViewController: UIViewController {
    
    // MARK: - Variables
    let quesosArrayData = ["quesoProvolone1", "quesoProvolone2", "quesoProvolone3", "quesoProvolone4", "quesoProvolone5"]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    
    @IBOutlet weak var imagenQuesoImV: UIImageView!
    
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configuracionUI()
        self.configuracionPickerView()
    }
    
    // MARK: - Metodos privados
    private func configuracionUI(){
        self.title = "Quesos del mundo"
        self.tituloQuesoLBL.text = self.quesosArrayData[0]
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[0])
        self.detalleTextQuesoTXV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[0])
    }
    
    private func configuracionPickerView() {
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
    }

}

//MARK: - Extensions
extension NavigationViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[row])
        
        
        switch row {
        case 0:
            self.detalleTextQuesoTXV.text = "La quesoProvolone1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            break
        case 1:
            self.detalleTextQuesoTXV.text = "La quesoProvolone2 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            break
        case 2:
            self.detalleTextQuesoTXV.text = "La quesoProvolone3 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            break
        case 3:
            self.detalleTextQuesoTXV.text = "La quesoProvolone4 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            break
        default:
            self.detalleTextQuesoTXV.text = "La quesoProvolone5 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
            break
        }
    }
}

extension NavigationViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }
    
}

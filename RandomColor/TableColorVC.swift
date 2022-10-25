//
//  TableColorVC.swift
//  RandomColor
//
//  Created by Burak Şahin Erden on 24.10.2022.
//

import UIKit

class TableColorVC: UIViewController {
    
    var colors: [UIColor]=[]

    enum Cells {
        static let colorCall = "ColorCell"
    }
    
    enum Seques {
        static let toDetail = "ToColorsDetailVC"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        // Do any additional setup after loading the view.
    }
    
    func addRandomColors(){
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC
        destVC.color = sender as? UIColor
    }


}


extension TableColorVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCall) else{
            return UITableViewCell()
        }
    
        cell.backgroundColor =  colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Seques.toDetail, sender: color)
    }
}

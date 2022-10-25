//
//  ColorsDetailVC.swift
//  RandomColor
//
//  Created by Burak Şahin Erden on 24.10.2022.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color:UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue

    }

}

//
//  ChoseCityViewController.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit
protocol ChoseCityViewControllerDelegate {
    func didChooseCity(_ city: String?)
}

class ChoseCityViewController: UIViewController,UITextFieldDelegate {
    var delegate: ChoseCityViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        confirmAndDissmis()
    }
    
    func confirmAndDissmis(){
        delegate?.didChooseCity(textField.text)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dissmis(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

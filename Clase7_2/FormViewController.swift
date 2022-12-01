//
//  FormViewController.swift
//  Clase7_2
//
//  Created by TEO on 1/12/22.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: -Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeDocuemntTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
        
    private struct Const {
        static let errorMessage = "Fue imposible enviar la información al servidor"
        static let titleAction = "OK"
        static let destination = "goToSuccessfulScreen"
    }

    let caseError = Int.random(in: 1...3)
    
    @IBAction func sendButtonPressed() {
        redirect()
    }
    
    private func executeErrorAlert(){
        let errorAlert = UIAlertController(title: "Error", message: Const.errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Const.titleAction, style: .default)
        errorAlert.addAction(okAction)
        present(errorAlert, animated: true)
    }
    
    private func executeTransition(){
        performSegue(withIdentifier: Const.destination, sender: self)
    }
    
    private func thereWasAnError() -> Bool {
        let error = Int.random(in: 1...3)
        return error == caseError
    }
    
    private func redirect() {
        if areThereAnyEmptyFields() {
            executeErrorFieldEmptyAlert()
        } else {
            if thereWasAnError(){
                executeErrorAlert()
            } else {
                executeTransition()
            }
        }
        
    }
    
    private func validateFields(){
        if areThereAnyEmptyFields() {
            executeErrorFieldEmptyAlert()
        }
    }
    
    private func areThereAnyEmptyFields() -> Bool {
        let name = nameTextField.text ?? ""
        let typeDocument = typeDocuemntTextField.text ?? ""
        let document = documentTextField.text ?? ""
        
        return name.isEmpty || typeDocument.isEmpty || document.isEmpty
    }
    
    private func executeErrorFieldEmptyAlert(){
        let errorAlert = UIAlertController(title: "Error", message: "Hay al menos un campo vacío", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        errorAlert.addAction(cancelAction)
        present(errorAlert, animated: true)
    }

}


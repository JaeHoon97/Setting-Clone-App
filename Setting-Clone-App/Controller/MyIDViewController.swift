//
//  MyIDViewController.swift
//  Setting-Clone-App
//
//  Created by 재훈 on 1/20/24.
//

import UIKit

class MyIDViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAddTarget()
        self.nextButton.isEnabled = false        
    }
    
    func setupAddTarget() {
        self.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        self.cancelButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func emailTextFieldChanged(sender: UITextField) {
        if(sender.text?.isEmpty == true) {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }
    
    @objc func nextButtonTapped() {
        self.dismiss(animated: true)
    }
}



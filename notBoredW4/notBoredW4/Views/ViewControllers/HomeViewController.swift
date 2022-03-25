//
//  HomeViewController.swift
//  notBoredW4
//
//  Created by Mauro Emmanuel Alvarenga on 24/03/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    var viewModel: UIViewController?
    
    // MARK: Outlets
    @IBOutlet weak var participantsTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        setTextFieldDelegate()
    }
   
    //MARK: Actions
    @IBAction func didTapStartButton(_ sender: UIButton) {
        let userDefaults = UserDefaults()
        let participants = Int(participantsTextField.text ?? "0")
        userDefaults.set(participants, forKey: "participants")
        if let price = Double(priceTextField.text ?? "0.0") {
            userDefaults.set(price, forKey: "price")
        }
        presentTabBarController()
    }
    
    @IBAction func didEndEditingParticipants(_ sender: Any) {
        validate()
    }
    
    @IBAction func didEndEditingPrice(_ sender: Any) {
        validate()
    }
    
    @IBAction func didToggleSwitch(_ sender: UISwitch) {
        validate()
    }
    
    @IBAction func didTapTermsAndConditions(_ sender: UIButton) {
        // Show Terms and Conditions View
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditions", bundle: nil)
        self.present(vc, animated: true)
    }
    
    func presentTabBarController() {
            let tabBarController = TabBarViewController(nibName: "TabBarViewController", bundle: nil)
            tabBarController.modalPresentationStyle = .overFullScreen
            self.present(tabBarController, animated: true)
        }
    
    private func validate() {
        if participantsTextField.hasText {
            let participantsInt = Int(participantsTextField.text ?? "0")
            if participantsTextField.hasText && termsSwitch.isOn && participantsInt != 0 {
                startButton.isEnabled = true
            } else {
                startButton.isEnabled = false
            }
        } else {
            if termsSwitch.isOn {
                startButton.isEnabled = true
            } else {
                startButton.isEnabled = false
            }
        }
    }
    
}

// MARK: TextField Delegate
extension HomeViewController: UITextFieldDelegate {
    
    func setTextFieldDelegate() {
        participantsTextField.delegate = self
        priceTextField.delegate = self
    }
    
    // MARK: Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    } // Dismiss keyboard when another part of the view is tapped.
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    } // Dismiss keyboard when return key is pressed.
    
}

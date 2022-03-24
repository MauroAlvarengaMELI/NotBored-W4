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
        // TODO: Checkear validaciones
        // TODO: Navegar al TabViewController
        let vc = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        self.present(vc, animated: true)
        
    }
    
    @IBAction func didEditParticipants(_ sender: UITextField) {
        // TODO: Ver validaciones
    }
    
    @IBAction func didEditPrice(_ sender: UITextField) {
        // TODO: Ver validaciones
    }
    
    @IBAction func didEndEditingParticipants(_ sender: Any) {
        if termsSwitch.isOn {
            startButton.isEnabled = true
        }
    }
    
    @IBAction func didEndEditingPrice(_ sender: Any) {
        if participantsTextField.hasText && termsSwitch.isOn {
            startButton.isEnabled = true
        }
    }
    
    @IBAction func didToggleSwitch(_ sender: UISwitch) {
        if participantsTextField.hasText {
            startButton.isEnabled = true
        }
    }
    
    @IBAction func didTapTermsAndConditions(_ sender: UIButton) {
        // Abrir Terminos y Condiciones
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditions", bundle: nil)
        //vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
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

//
//  SuggestionViewController.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 24/03/2022.
//

import UIKit

class SuggestionViewController: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var anotherButton: UIButton!
    @IBOutlet weak var categoryStack: UIStackView!
    
    private var viewModel: ActivityViewModel!
    let userDefaults = UserDefaults()
    var participants: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryStack.isHidden = true
        setupView()
    }
    
    private func setupView(){
        // set the visual values of the button
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        anotherButton.layer.cornerRadius = 10
        anotherButton.setTitleColor(UIColor.white, for: .normal)
        anotherButton.backgroundColor = .systemBlue
        setCurretView()
    }
    
    private func getActivity(){
        viewModel?.getActivity() { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityLabel.text = strongSelf.viewModel.getCurrentActivity()
        }
    }
    
    private func setCurretView(){
        getActivity()
        setParticipants()
        // set price label
        let value = 0.0 //activity.price ?? 0.0 CHANGE VALUE
        if value == 0.0 {
            priceLabel.text = "Free"
        } else if value <= 0.3 {
            priceLabel.text = "Low"
        } else if value <= 0.6 {
            priceLabel.text = "Medium"
        } else {
            priceLabel.text = "High"
        }
    }
    
    private func setParticipants(){
        if participants != nil {
            participantsNumberLabel.text = ("\(self.participants)")
        } else {
            participantsNumberLabel.text = ("\(0)")
        }
        
    }
    
    private func isCategory(for activity: Activity) {
        let category = activity.type
        if category != nil || category != "" {
            categoryLabel.text = activity.type
            categoryStack.isHidden = false
        }
    }

    @IBAction func anotherButtonAction(_ sender: UIButton) {
        getActivity()
    }
    
}

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
        
    private var viewModel: HomeViewController!
    private var participants: String?
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.isHidden = true
        setupView()
        getActivity()
    }
    
    private func setupView(){
        // set the visual values of the button
        anotherButton.layer.cornerRadius = 50
        anotherButton.setTitleColor(UIColor.white, for: .normal)
        anotherButton.backgroundColor = .systemBlue
        setCurretView()
    }
    
    private func getActivity(){
        viewModel.getActivity() { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.setCurretView()
        }
    }
    
    private func setCurretView(){

        activityLabel.text = viewModel.getCurrentActivity()
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
        if let participantSet = userDefaults.string(forKey: "username") {
            self.participants = participantSet
            self.participantsNumberLabel.text = participantSet
        }
    }
    
    private func isCategory(for activity: Activity) {
        let category = activity.type
        if category != nil || category != "" {
            categoryLabel.text = activity.type
            categoryLabel.isHidden = false
        }
    }

    @IBAction func anotherButtonAction(_ sender: UIButton) {
        getActivity()
    }
    
}

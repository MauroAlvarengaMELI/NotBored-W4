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
    
    private var viewModel: ActivityViewModel = ActivityViewModel(service: ActivityService())
    let userDefaults = UserDefaults()
    var participants: Int?
    var price: Double?
    var type: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getParticipantsAndPrice()
        getActivity()
        
        
        categoryStack.isHidden = false
    }
    
    private func setupView(){
        // set the visual values of the button
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        anotherButton.layer.cornerRadius = 10
        anotherButton.setTitleColor(UIColor.white, for: .normal)
        anotherButton.backgroundColor = .systemBlue
    }
    
    private func getActivity(){
        guard let participants = participants else {
            return
        }
        viewModel.getActivity(forType: self.type, participants: participants) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityLabel.text = strongSelf.viewModel.getCurrentActivity()
            strongSelf.participantsNumberLabel.text = ("\(strongSelf.viewModel.getParticipants())")
            strongSelf.setPrice()
            strongSelf.getCategory()
        }
    }
    
    private func setPrice(){
        // set price label
        let value = viewModel.getPrice()
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
    
    private func getCategory() {
        let category = viewModel.getCategories()
        if category != "" {
            categoryLabel.text = viewModel.getCategories().capitalized
            categoryStack.isHidden = false
        }
    }
    
    private func getParticipantsAndPrice() {
        self.participants = userDefaults.integer(forKey: "participants")
        //guard let price = userDefaults.double(forKey: "price") else { return }
    }

    @IBAction func anotherButtonAction(_ sender: UIButton) {
        getActivity()
    }
    
}

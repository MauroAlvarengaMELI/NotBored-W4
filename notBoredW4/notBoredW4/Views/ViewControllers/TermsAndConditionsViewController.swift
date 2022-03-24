//
//  TermsAndConditionsViewController.swift
//  notBoredW4
//
//  Created by Mauro Emmanuel Alvarenga on 24/03/2022.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}

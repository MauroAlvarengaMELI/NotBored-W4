//
//  HomeViewController.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 18/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var currentActivity: Activity?
    private let activityService = ActivityService()
    
    @IBOutlet weak var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getActivity2()
    }

    func getActivity(completion: @escaping () -> Void) {
        activityService.getActivity() { [weak self] receivedActivity in
            guard let strongSelf = self else { return }
            strongSelf.currentActivity = receivedActivity
            completion()
        }
    }
    
    func getCurrentActivity() -> String {
        if let activity = self.currentActivity {
            return activity.activity ?? " "
        }
        return "Error getting question"
    }
    
    private func getActivity2() {
        getActivity() { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityLabel.text = strongSelf.getCurrentActivity()
        }
    }
    
}

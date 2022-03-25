//
//  HomeViewController.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 18/03/2022.
//

// MARK: Utility class used only for testing purposes. Read under your own risk. 

import UIKit

class TestViewController: UIViewController {
    
    private var currentActivity: Activity?
    private let activityService = ActivityService()
    
    @IBOutlet weak var activityLabel: UILabel!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getActivity2()
//    }

//    func getActivity(completion: @escaping () -> Void) {
//        activityService.getActivity(for: 1) { [weak self] receivedActivity in
//            guard let strongSelf = self else { return }
//            strongSelf.currentActivity = receivedActivity
//            completion()
//        }
//    }
    
    func getCurrentActivity() -> String {
        if let activity = self.currentActivity {
            return activity.activity ?? " "
        }
        return "Error getting activity"
    }
    
//    private func getActivity2() {
//        getActivity() { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.activityLabel.text = strongSelf.getCurrentActivity()
//        }
//    }
    
    
    // Home Tab Test
    private func testHomeTab() {
        let thirdTabTitle = "Home"
        let thirdTabImage = UIImage(systemName: "house")
        let thirtTabViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        let thirdTabNavigationController = UINavigationController(rootViewController: thirtTabViewController)
        let thirdTabBarItem = UITabBarItem(title: thirdTabTitle, image: thirdTabImage, selectedImage: nil)
        thirdTabNavigationController.tabBarItem = thirdTabBarItem
    }
    
}

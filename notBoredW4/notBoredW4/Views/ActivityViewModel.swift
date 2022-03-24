//
//  ActivityViewModel.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 24/03/2022.
//

import Foundation

class ActivityViewModel {
    
    private let activityService: ActivityService
    private var currentActivity: Activity?
    
    init(service: ActivityService) {
        self.activityService = service
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
    
}


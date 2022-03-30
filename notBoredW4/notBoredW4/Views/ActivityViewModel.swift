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
    
    func getActivity(forType type: String, participants: Int, completion: @escaping () -> Void) {
        activityService.getActivity(forType: type, participants: participants) { [weak self] receivedActivity in
            guard let strongSelf = self else { return }
            strongSelf.currentActivity = receivedActivity
            completion()
        }
    }
    
    func getCurrentActivity() -> String {
        if let activity = self.currentActivity?.activity {
            return activity
        }
        return "Error getting the activity"
    }
    
    func getParticipants() -> Int {
        if let activity = self.currentActivity {
            return activity.participants ?? 0
        }
        return 0
    }
    
    func getPrice() -> Double {
        if let activity = self.currentActivity {
            return activity.price ?? 0.0
        }
        return 0.0
    }
    
    func getCategories() -> String {
        if let activity = self.currentActivity {
            return activity.type ?? " "
        }
        return "Error getting the category"
    }
    
    func hasError() -> Bool {
        if (self.currentActivity?.error) != nil {
            return true
        }
        return false
    }
    
    func getError() -> String {
        if let error = self.currentActivity?.error {
            return error
        }
        return "No error found"
    }
}


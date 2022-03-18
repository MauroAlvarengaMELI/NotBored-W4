//
//  ActivityService.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 18/03/2022.
//

import Foundation
import Alamofire

class ActivityService {

//    private struct ReceivedActivity: Codable {
//        let results: [Activity]
//    }
    
    let apiClient = AlamofireAPIClient()

    func getActivity(completion: @escaping (Activity) -> Void) {
        var activityURL: String
        activityURL = "http://www.boredapi.com/api/activity/"
        apiClient.get(url: activityURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let dataOK = data {
                        NSLog(dataOK.description)
                        let activity = try JSONDecoder().decode(Activity.self, from: dataOK)
                        print(activity)
                        completion(activity)
                    }
                } catch {
                    print(error)
                    completion(Activity(activity: "catch error", accessibility: 0, type: "catch error", participants: 0, price: 0, link: "catch error", key: "catch error"))
                }
            case .failure(let error):
                print(error)
                completion(Activity(activity: "failure error", accessibility: 0, type: "failure error", participants: 0, price: 0, link: "failure error", key: "failure error"))
            }
        }
    }
}

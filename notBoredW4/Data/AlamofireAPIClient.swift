//
//  AlamofireAPIClient.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 18/03/2022.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
}

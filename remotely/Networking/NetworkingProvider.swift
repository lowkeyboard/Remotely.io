//
//  NetworkingProvider.swift
//  remotely
//
//  Created by cagla copuroglu on 23.06.2022.
//

import Foundation
import Alamofire

class NetworkingProvider {

    static let share = NetworkingProvider()

    func fetchBreed(artist: String, success: @escaping (_ breeds: BreedResponse) -> Void, failure: @escaping (_ error: Error?) -> Void ) {

        let urlString = ""

        guard let url: URL = URL(string: urlString),
              let token = SessionManager.shared.token else { return }
        AF.request(url, method: .get,
                   headers: ["Authorization": "Bearer \(token)"]).responseDecodable(of: BreedResponse.self) { (response) in
            switch response.result {

            case .success:
                guard let artists =  response.value else { return }
                success(artists)
            case .failure(let error):
                print(error)
                failure(response.error)
            }
        }
    }
}

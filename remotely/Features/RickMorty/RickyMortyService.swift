//
//  RickyMortyService.swift
//  remotely
//
//  Created by cagla copuroglu on 1.08.2022.
//

import Alamofire

enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"

    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortiyeService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickyMortyService: IRickyMortiyeService {

    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }

}

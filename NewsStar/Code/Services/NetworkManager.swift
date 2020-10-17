//
//  NetworkManager.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit
import Alamofire

enum APIError {
    case kNetworkError
    case kAPIError
    case kDecodingError
    
}
enum APIs: URLRequestConvertible{

}


struct NetworkManager {
    
    let jsonDecoder = JSONDecoder()
  //  let fileHandler = FileHandler()
    let imageCompressionScale: CGFloat = 0.25
    
    
    func getTopHeadlines(completion: @escaping([String]?, APIError?) -> ()) {
        AF.request(APIs.kGetTopHeadlines).validate().responseJSON { json in
            switch json.result {
            case .failure:
                completion(nil, .kAPIError)
                break
            case .success(let jsonData):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonData, options: .sortedKeys)  {
                    do {
                        let popularTitles = try jsonDecoder.decode([String].self, from: jsonData)
                        completion(popularTitles.map { $0.components(separatedBy: "/")[2] }, nil)
                    } catch {
                        print(error)
                        completion(nil, .kDecodingError)
                    }
                } else {
                    completion(nil, .kNetworkError)
                }
            }
        }
    }
    
}


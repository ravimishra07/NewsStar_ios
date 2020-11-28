//
//  Service.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation
import Alamofire

protocol NewsServiceProtocol : class {
    func callApiWithGet(_ completion: @escaping ((Result<NewsModel, ErrorResult>) -> Void))
}
//enum ResponseCode {
//    case case
//}
class Service{
    typealias apiResponse = (Result<Data, ErrorResult>) -> Void
    static let sharedInstance = Service()

    func callApiWithGet(endUrl: String, parameters: [String: Any],  callback: @escaping apiResponse){
        
        let headers : HTTPHeaders = ["Content-Type":"application/json"]
        Alamofire.request(endUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                switch response.result{
                case .success(let success):
                    print("success >\(success)")
                    if let responseData = response.data {
                        callback(.success(responseData))
                    }else{
                        callback(.failure(.kParser(string: "received data is null, cannot parse")))
                    }
                case .failure(let error):
                    callback(.failure(.kCustom(string: "api call failed \(error)")))
                }
            }
    }
    //typealias apiResponse = (Data?)->()
}


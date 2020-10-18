//
//  Service.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation
import Alamofire
class Services: NSObject{
    //typealias apiResponse = (Data?)->()
    typealias apiResponse = (Result<Data, ErrorResult>) -> Void
    static let sharedInstance = Services()
    
    func callApiWithPost(endUrl: String, parameters: [String: Any],  callback: @escaping apiResponse){
        
        let headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        AF.request(endUrl, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
            .responseJSON { (response) in
                //Loader.instance.stop()
                if let data = response.data {
                    switch response.result{
                    case .success(let success):
                        print("success >\(success)")
                        if response.response?.statusCode == 200 {
                            callback(.success(data))
                        }else if response.response?.statusCode == 400{
                            callback(.failure(.kCustom(string: "Bad Request")))

                        }else{
                            callback(.failure(.kCustom(string: "Some error occured")))
                        }
                    case .failure(let error):
                        print("failure >\(error)")
                        callback(.failure(.kCustom(string: "Some error occured")))
                }

                }else{
                    callback(.failure(.kCustom(string: "no data received from api")))
                }
              
        }
    }
}


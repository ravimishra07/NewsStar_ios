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

class Services: NSObject{
    func callApiWithGet(_ completion: @escaping ((Result<NewsModel, ErrorResult>) -> Void)) {
        <#code#>
    }
    
    //typealias apiResponse = (Data?)->()
    typealias apiResponse = (Result<Data, ErrorResult>) -> Void
    static let sharedInstance = Services()
    
}


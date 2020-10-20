//
//  RequestFactory.swift
//  NewsStar
//
//  Created by Ravi Mishra on 19/10/20.
//

import Foundation

final class RequestFactory{
    
    enum Method: String{
        case GET
        case POST
        case DELETE
        case PUT
        case PATCH
    }
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

//
//  ErrorResult.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

enum ErrorResult: Error{
    case kNetwork(string: String)
    case kParser(string: String)
    case kCustom(string: String)

}

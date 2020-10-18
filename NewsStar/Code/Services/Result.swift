//
//  Result.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

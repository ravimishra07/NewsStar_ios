//
//  PersonalViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

struct PersonalViewModel {
    weak var dataSource: GenericDataSource<NewsModel>?
    init(dataSource: GenericDataSource<NewsModel>?) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    
}

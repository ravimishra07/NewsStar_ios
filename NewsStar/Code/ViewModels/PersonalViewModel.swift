//
//  PersonalViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

struct PersonalViewModel {
    weak var dataSource: GenericDataSource<NewsModel>?
    weak var service: Services?

    init(dataSource: GenericDataSource<NewsModel>?, service: Services.sharedInstance) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    //let service =   Service.sharedInstance.
    func fetchNews(){
        let params:[String:Any] = ["q":"India"]
        Services.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            
                
            }
        }
    }
}

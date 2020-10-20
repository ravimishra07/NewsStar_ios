//
//  PersonalViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

struct PersonalViewModel {
    weak var dataSource: GenericDataSource<Article>?
    weak var service: Service?

    init(dataSource: GenericDataSource<Article>?) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    //let service =   Service.sharedInstance.
    func fetchNews(){
        let params:[String:Any] = ["q":"India"]
        Service.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            case .success(let data):
           
            do {
            let newsModel =  try JSONDecoder().decode(NewsModel.self, from: data)
                dataSource?.data.value = newsModel.articles
            }catch{
                print(error.localizedDescription)
            }
            case .failure(let resError):
                print(resError.localizedDescription)
                
            }
        }
    }
}

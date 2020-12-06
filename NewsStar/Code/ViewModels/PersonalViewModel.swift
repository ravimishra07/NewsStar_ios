//
//  PersonalViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

struct PersonalViewModel {
    weak var dataSource: GenericDataSource<Article>?
    weak var shimmerDataSource: GenericDataSource<Int>?
    weak var service: Service?

    init(dataSource: GenericDataSource<Article>?) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    
    func loadShimmer(){
        shimmerDataSource?.data.value = [1,2,3,4,5]
    }
    //let service =   Service.sharedInstance.
    func fetchNews(callback: @escaping ((Bool)->())){
        let params:[String:Any] = ["q":" India", "apiKey": API_KEY]
        Service.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            case .success(let data):
            do {
            let newsModel =  try JSONDecoder().decode(NewsModel.self, from: data)
                print("status")
                print(newsModel.status)
                dataSource?.data.value = newsModel.articles
                callback(true)
                
            }catch{
                print(error.localizedDescription)
                callback(false)
            }
            case .failure(let resError):
                print(resError.localizedDescription)
                callback(false)
                
            }
        }
    }
}

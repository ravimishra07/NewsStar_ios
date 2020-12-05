//
//  NewsViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 04/12/20.
//

import Foundation
struct NewsViewModel {
    weak var dataSource: GenericDataSource<Article>?
    weak var service: Service?

    init(dataSource: GenericDataSource<Article>?) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    
    func fetchNews(query: String){
        let params:[String:Any] = ["q":query, "apiKey": API_KEY]
        Service.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            case .success(let data):
            do {
            let newsModel =  try JSONDecoder().decode(NewsModel.self, from: data)
                print("status")
                print(newsModel.status)
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

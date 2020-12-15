//
//  NewsViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 04/12/20.
//

/**
 q- keyword tosearch in acrticle body and title
 
 qInTitle - keyword to search in title only
 
 sortBy  1. relevancy
 2. popularity
 3. publishedAt
 
 pageSize- for number of article in api call
 
 page -  page number
 
 */
import Foundation

struct NewsViewModel {
    weak var dataSource: GenericDataSource<Article>?
    weak var service: Service?
    let PAGE_SIZE = "pageSize"
    let PAGE_SIZE_COUNT = 10
    
    let QUERY = "q"
    let QUERY_IN_TITLE = "qInTitle"
    let PAGE = "page"
    let API_KEY_CONST = "apiKey"
    
    init(dataSource: GenericDataSource<Article>?) {
        self.dataSource = dataSource
    }
    
    var onErrorHandling: ((ErrorResult?)->Void)?
    
    func fetchNews(query: String, page: Int, context: SearchViewController){
        
        /// show loader
        Loader.instance.start(viewController: context)
        
        /// set params
        let params:[String: Any] = [QUERY:query,
                                    API_KEY_CONST: API_KEY,
                                    PAGE_SIZE: PAGE_SIZE_COUNT,
                                    PAGE: page]
        /// api call
        Service.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            case .success(let data):
                do {
                    let newsModel =  try JSONDecoder().decode(NewsModel.self, from: data)
                    Global.articleList.append(contentsOf: newsModel.articles)
                    dataSource?.data.value = newsModel.articles
                    Loader.instance.stop()
                }catch{
                    print(error.localizedDescription)
                    Loader.instance.stop()
                }
            case .failure(let resError):
                print(resError.localizedDescription)
                Loader.instance.stop()
                
            }
        }
    }
    
    func fetchNews(query: String, page: Int, context: SearchViewController, isPaginating :Bool = false){
       
        /// show loader
        Loader.instance.start(viewController: context)
        
        /// set params
        let params:[String: Any] = [QUERY:query,
                                    API_KEY_CONST: API_KEY,
                                    PAGE_SIZE: PAGE_SIZE_COUNT,
                                    PAGE: page]
        /// api call
        Service.sharedInstance.callApiWithGet(endUrl: BASE_URL+EVERYTHING, parameters: params) { (result) in
            switch(result){
            case .success(let data):
                do {
                    let newsModel =  try JSONDecoder().decode(NewsModel.self, from: data)
                    Global.articleList.append(contentsOf: newsModel.articles)
                    
                    if isPaginating{
                        dataSource?.data.value += newsModel.articles
                    }else{
                        dataSource?.data.value = newsModel.articles
                    }
                    Loader.instance.stop()
                }catch{
                    print(error.localizedDescription)
                    Loader.instance.stop()
                }
            case .failure(let resError):
                print(resError.localizedDescription)
                Loader.instance.stop()
                
            }
        }
    }

}

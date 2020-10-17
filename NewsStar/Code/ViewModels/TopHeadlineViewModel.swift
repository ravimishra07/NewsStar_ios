//
//  TopHeadlineViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 04/10/20.
//

import UIKit

struct TopHeadlineViewModel {
    // MARK:- variable for the viewModel
    
    let networkManager: NetworkManager
    
    let newsId: String
    var offset: Int = 0
    var limit: Int = 5
    
    var actors: BoxBind<[String]?> = BoxBind(nil)
    var prefetch: BoxBind<Bool> = BoxBind(false)
    var topHeadlinesOffset: BoxBind<(Int, Int)> = BoxBind((0, 10))

  //  var noData: BoxBind<(ListType?)> = BoxBind(nil)
    
    // MARK:- initializer for the viewModel
    init(networkManager: NetworkManager) {
      
        self.networkManager = networkManager
      
        /// Getting 10 popularTitles and ComingSoonTitles from the API
        let (offset,limit) = self.topHeadlinesOffset.value
        self.getToHeadLines(offset: offset, limit: limit)
    }
    // MARK:- functions for the viewModel
    func getToHeadLines(offset: Int, limit: Int) {
    
        fetchTopNews(offset: offset, limit: limit)
       
    }
    
    func fetchTopNews(offset: Int, limit: Int) {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { fetchTimer in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                var moviesList: [String] = [String]()
               
                if (!moviesList.isEmpty) {
                    let titleIds = moviesList[offset..<limit]
                    self.fetchAndStoreTitles(titleIds: Array(titleIds), type: type)
                    fetchTimer.invalidate()
                }
            }
        }
    }
    
   
}

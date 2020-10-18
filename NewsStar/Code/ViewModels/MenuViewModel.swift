//
//  MenuViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation

struct MenuViewModel{
    weak var dataSource: GenericDataSource<MenuModel>?
    
    init(dataSource: GenericDataSource<MenuModel>?) {
        self.dataSource = dataSource
    }
    func getMenuData(){
        let trendingData = MenuModel(menuName: "Trending", menuImage: "trending")
        let sportsData = MenuModel(menuName: "Sports", menuImage: "sports")
        let technologyData = MenuModel(menuName: "Technology", menuImage: "technology")
        let healthData = MenuModel(menuName: "HealthCare", menuImage: "healthcare")
        let politicsData = MenuModel(menuName: "Politics", menuImage: "politics")
        let menuArray: [MenuModel] = [trendingData,sportsData,technologyData,healthData,politicsData]
        dataSource?.data.value = menuArray
    }
}

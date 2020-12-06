//
//  ShimmerViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 06/12/20.
//

import Foundation

struct ShimmerViewModel{
    weak var dataSource: GenericDataSource<Int>?
    
    init(dataSource: GenericDataSource<Int>?) {
        self.dataSource = dataSource
    }
    func getData(){
        dataSource?.data.value = [0,0,0,0,0]
    }
    
}

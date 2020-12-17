//
//  PreferenceViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 17/12/20.
//

import Foundation
struct PreferenceViewModel {
    let dataSource: GenericDataSource<ChooseTopic>?
    init(dataSource: GenericDataSource<ChooseTopic>) {
        self.dataSource = dataSource
    }
    func fetechTopic(){
        // call from api/coreData
        
        let topic1 = ChooseTopic(topicName: "Politics", isLiked: false)
        let topic2 = ChooseTopic(topicName: "Cricket", isLiked: true)
        let topic3 = ChooseTopic(topicName: "India", isLiked: false)
        let topic4 = ChooseTopic(topicName: "Technologies", isLiked: true)
        let topic5 = ChooseTopic(topicName: "Finance", isLiked: false)
        let topic6 = ChooseTopic(topicName: "Social Network", isLiked: false)
        let topic7 = ChooseTopic(topicName: "Corona Virus", isLiked: false)
        let topic8 = ChooseTopic(topicName: "Global news", isLiked: true)
        dataSource?.data.value = [topic1,topic4,topic2,topic7,topic6,topic5,topic8,topic3]//,topic3,topic4,topic5,topic6,topic7,topic8]

    }
    func preferenceData() -> [ChooseTopic]?{
        
        return dataSource?.data.value
    }
}

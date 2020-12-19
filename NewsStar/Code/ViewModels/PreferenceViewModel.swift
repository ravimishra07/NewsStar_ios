//
//  PreferenceViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 17/12/20.
//

import Foundation
import CoreData
struct PreferenceViewModel {
    let dataSource: GenericDataSource<ChooseTopic>?
    var topicArray: [ChooseTopic] = []
    init(dataSource: GenericDataSource<ChooseTopic>) {
        self.dataSource = dataSource
    }
   mutating func fetechTopic(){
        // call from api/coreData
        
        let topic1 = ChooseTopic(topicName: "Politics", isLiked: false)
        let topic2 = ChooseTopic(topicName: "Cricket", isLiked: false)
        let topic3 = ChooseTopic(topicName: "India", isLiked: false)
        let topic4 = ChooseTopic(topicName: "Technologies", isLiked: false)
        let topic5 = ChooseTopic(topicName: "Finance", isLiked: false)
        let topic6 = ChooseTopic(topicName: "Social Network ", isLiked: false)
        let topic7 = ChooseTopic(topicName: "Corona Virus", isLiked: false)
        let topic8 = ChooseTopic(topicName: "Global news", isLiked: false)
        
        self.topicArray =  [topic1,topic6,topic7,topic4,topic5,topic2,topic3,topic8,topic1,topic6,topic7,
                       topic4,topic5,topic2,topic3,topic8,topic1,topic6,topic7,topic4,topic5,topic2,topic3,topic8]
        dataSource?.data.value = topicArray
        
    }
   mutating func setTopicList(index: Int){
        let selectedItem = topicArray[index]
        let updatedItem = ChooseTopic(topicName: selectedItem.topicName, isLiked: !selectedItem.isLiked)
        topicArray[index] = updatedItem
        dataSource?.data.value[index] = updatedItem
    }
    func preferenceData() -> [ChooseTopic]?{
        
        return dataSource?.data.value
    }
}

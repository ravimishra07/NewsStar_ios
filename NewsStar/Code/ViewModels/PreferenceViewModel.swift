//
//  PreferenceViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 17/12/20.
//

import UIKit
import CoreData
struct PreferenceViewModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    
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
    
    mutating func saveUserChoices() {
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let preferenceData = NSManagedObject(entity: entity!, insertInto: context)
        saveData(userObject:preferenceData)
    }
    func saveData(userObject: NSManagedObject){
        var userPrefDictionary: [String: Bool] = [:]
        for (i , _) in topicArray.enumerated(){
            let topic = topicArray[i]
            //userObject.setValue(topic.isLiked, forKey: "")
            userPrefDictionary[topic.topicName] = topic.isLiked
        }
        userObject.setValue(userPrefDictionary, forKey: "preferences")
        print("Storing Data..")
        do {
            try context.save()
            print("date successfully stored")
            
        } catch {
            print("Storing data Failed")
        }
    }
    mutating func retriveData(){
        print("Fetching Data..")
        var choicePref: [ChooseTopic] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let userPref = data.value(forKey: "preferences") as! [String: Bool]
                for item in userPref{
                    let topic = ChooseTopic(topicName: item.key, isLiked: item.value)
                    choicePref.append(topic)
                }
            }
        } catch {
            print("Fetching data Failed")
        }
       if choicePref.count == 0{
            fetechTopic()
        }
        
    }
    func preferenceData() -> [ChooseTopic]?{
        return dataSource?.data.value
    }
}

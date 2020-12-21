//
//  PreferenceViewModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 17/12/20.
//

import UIKit
import CoreData
/*
 1 - false
 2 - true
 */
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
        
        let topic1 = ChooseTopic(topicName: "Politics", isLikedValue: 1)
        let topic2 = ChooseTopic(topicName: "Cricket", isLikedValue: 1)
        let topic3 = ChooseTopic(topicName: "India", isLikedValue: 1)
        let topic4 = ChooseTopic(topicName: "Technologies", isLikedValue: 1)
        let topic5 = ChooseTopic(topicName: "Finance", isLikedValue: 1)
        let topic6 = ChooseTopic(topicName: "Social Network ", isLikedValue: 1)
        let topic7 = ChooseTopic(topicName: "Corona Virus", isLikedValue: 1)
        let topic8 = ChooseTopic(topicName: "Global news", isLikedValue: 1)
        
        self.topicArray =  [topic1,topic6,topic7,topic4,topic5,topic2,topic3,topic8]
        dataSource?.data.value = topicArray
        
    }
    mutating func setTopicList(index: Int){
        let  selectedItem = topicArray[index]
        var topicValue = 1
        
        if selectedItem.isLikedValue == 2 {
            topicValue = 1
        }else{
            topicValue = 2
        }
        let updatedItem = ChooseTopic(topicName: selectedItem.topicName, isLikedValue: topicValue)
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
        var userPrefDictionary: [String: Int] = [:]
        for (i , _) in topicArray.enumerated(){
            let topic = topicArray[i]
            //userObject.setValue(topic.isLiked, forKey: "")
            var status = 1
            if topic.isLikedValue == 2{
                status = 1
            }else{
                status = 2
            }
            
            userPrefDictionary[topic.topicName] = status
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
//        var choicePref: [ChooseTopic] = []
        context = appDelegate.persistentContainer.viewContext
        //        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        //        let preferenceData = NSManagedObject(entity: entity!, insertInto: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        if let cxt = self.context{
            do {
                let result = try cxt.fetch(request)
                for data in result as! [NSManagedObject] {
                    
                    if let userPref = data.value(forKey: "preferences") as? [String:Int]{
                        self.topicArray.removeAll()
                        for item in userPref{
                            let topic = ChooseTopic(topicName: item.key, isLikedValue: item.value)
                            
                            print("preference is------> \(userPref)")
                            topicArray.append(topic)
                            topicArray.sort{ $0.topicName < $1.topicName}
                        }
                        topicArray.sort{ $0.topicName < $1.topicName}
                        dataSource?.data.value = topicArray
                       
                       // print("preference is \(userPref)")
                    }
                }
            } catch {
                fetechTopic()
                print("Fetching data Failed")
            }
        }else{
            print("context is empty")
        }
     
       if topicArray.count == 0{
        fetechTopic()
        print("context is empty")
        }
        
    }
    func preferenceData() -> [ChooseTopic]?{
        return dataSource?.data.value
    }
}

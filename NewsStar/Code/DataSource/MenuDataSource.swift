//
//  MenuDataSource.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class MenuDataSource: GenericDataSource<MenuModel>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCVCell", for: indexPath) as! MenuCVCell
        
        let menuName = self.data.value[indexPath.row]
        cell.menuLabel.text = menuName.menuName
        cell.menuImage.image = UIImage(named: menuName.menuImage)
        if indexPath.row == 0{
            cell.menuImage.tintColor = .red
           // cell.imgBackgroundView.backgroundColor = UIColor("ED4041")?.withAlphaComponent(1)
        }
        return cell
    }
    
}
//
//class PersonalisedDataSource: GenericDataSource<NewsModel>, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        data.value.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
//        return cell
//    }
//
//
//}

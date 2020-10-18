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

class MenuDataSource:  GenericDataSource<MenuModel>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCVCell", for: indexPath) as! MenuCVCell
        
        let menuName = self.data.value[indexPath.row]
        cell.menuLabel.text = menuName.menuName
        cell.menuImage.image = UIImage(named: menuName.menuImage)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width/5, height: 150)
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.value.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCVCell", for: indexPath) as! MenuCVCell
//
//        let menuName = self.data.value[indexPath.row]
//        cell.menuLabel.text = menuName
//
//        return cell
//    }
}

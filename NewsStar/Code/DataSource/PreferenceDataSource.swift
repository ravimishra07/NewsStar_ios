//
//  PreferenceDataSource.swift
//  NewsStar
//
//  Created by Ravi Mishra on 17/12/20.
//

import UIKit

class PreferenceDataSource: GenericDataSource<ChooseTopic>, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerferenceCell.description(), for: indexPath) as? PerferenceCell else{
            return UICollectionViewCell()
        }
        let cellData = data.value[indexPath.row]
        cell.topicName.text = cellData.topicName
        
        cell.rotateImage(isSelected: cellData.isLiked)
        return cell
    }
    
}

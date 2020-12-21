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
//        var topicValue = 0
//
//        if cellData.isLiked{
//            topicValue = 1
//        }else{
//            topicValue = 0
//        }
        rotateImage(isSelected: cellData.isLikedValue, crossImage: cell.crossImage, softView: cell.softView)
        return cell
    }
    func rotateImage(isSelected: Int,crossImage: UIImageView,softView: SoftUIView){
        if isSelected == 2{
            UIView.animate(withDuration: 0.3, delay: 0, options: []) {
                crossImage.transform = CGAffineTransform(rotationAngle: .pi/4)
                softView.isSelected = true
                // self.mainView.backgroundColor = UIColor("#feb47b")

            } completion: { (isCompleted) in
                /// set value in preference
            }
        }else{
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]) {
             crossImage.transform = .identity
             softView.isSelected = false
             //   self.mainView.backgroundColor = .clear//
            } completion: { (isCompleted) in
                /// set value in preference
            }
        }
    }

    
}

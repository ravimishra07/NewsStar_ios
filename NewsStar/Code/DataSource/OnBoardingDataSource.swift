//
//  OnBoardingDataSource.swift
//  NewsStar
//
//  Created by Ravi Mishra on 21/12/20.
//

import UIKit

class OnboardingDataSource: GenericDataSource<OnBoardingModel>, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCVCell.description(), for: indexPath) as? OnBoardingCVCell else{
            return UICollectionViewCell()
        }
//        cell.onBoardingImage = UIImage(named: "")
        return cell
    }
}

//
//  ShimmerDataSource.swift
//  NewsStar
//
//  Created by Ravi Mishra on 06/12/20.
//

import UIKit
class ShimmerDataSource: GenericDataSource<Int>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionCell", for: indexPath) as! NewsCollectionCell
        cell.addShimmerLayer()
        return cell
    }
}

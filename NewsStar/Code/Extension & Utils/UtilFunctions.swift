//
//  UtilFunctions.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}
func loadImage(from url: URL, imgView: UIImageView){
    print("Download imageStarted")
    getData(from: url) { data, response, error in
        guard let data = data, error == nil else { return }
        print(response?.suggestedFilename ?? url.lastPathComponent)
        print("Download Finished")
        DispatchQueue.main.async() {
            imgView.image = UIImage(data: data)
        }
    }
}
//func addShimmerLayer(parentView: UIView, view: UIView){
//    let shimmerLayer = Shimmer(for: view, cornerRadius: 12)
//    parentView.layer.insertSublayer(shimmerLayer, above: view.layer)
//    shimmerLayer.startAnimation()
//}

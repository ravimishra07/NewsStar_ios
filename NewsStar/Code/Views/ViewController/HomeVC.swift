//
//  ViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

class HomeVC: UIViewController {
    override class func description() -> String {
        "HomeVC"
    }
    //MARK:- Outlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    let menuCellIdentifier = "MenuCVCell"
    let dataSource = MenuDataSource()
    
    lazy var viewModel : MenuViewModel = {
        let viewModel = MenuViewModel(dataSource: dataSource)
        return viewModel
    }()
    

    // MARK:- lifeCycle methods for the viewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.menuCollectionView.register(UINib(nibName:"MenuCVCell", bundle: nil), forCellWithReuseIdentifier: menuCellIdentifier)
        searchTextField.delegate = self
        self.menuCollectionView.dataSource = self.dataSource
        searchButton.layer.cornerRadius  = 4
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.menuCollectionView.reloadData()
        }
        self.viewModel.getMenuData()
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellIdentifier, for: indexPath) as? MenuCVCell else {return UICollectionViewCell()}
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = mainView.bounds.width
//        return CGSize(width: width/5, height: 150)
//    }

}
extension HomeVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

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
    @IBOutlet weak var personalTableView: UITableView!

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
        menuCollectionView.dataSource = self.dataSource
        menuCollectionView.delegate = self
        personalTableView.delegate = self
        searchButton.layer.cornerRadius  = 4
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.menuCollectionView.reloadData()
        }
        self.viewModel.getMenuData()
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 150)
    }
}
extension HomeVC: UITableViewDelegate{
    
}
extension HomeVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

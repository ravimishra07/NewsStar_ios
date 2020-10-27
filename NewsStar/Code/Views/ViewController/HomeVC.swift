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
    let personCellIdentifier = "NewsTableViewCell"
    let menuDataSource = MenuDataSource()
    let personalisedDataSource = PersonalDataSource()
    
    lazy var viewModel : MenuViewModel = {
        let viewModel = MenuViewModel(dataSource: menuDataSource)
        return viewModel
    }()
    
    lazy var peronalViewModel : PersonalViewModel = {
        let viewModel = PersonalViewModel(dataSource: personalisedDataSource)
        return viewModel
    }()
    
    // MARK:- lifeCycle methods for the viewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.menuCollectionView.register(UINib(nibName:"MenuCVCell", bundle: nil), forCellWithReuseIdentifier: menuCellIdentifier)
        self.personalTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.description())
        searchTextField.delegate = self
        menuCollectionView.dataSource = self.menuDataSource
        menuCollectionView.delegate = self
        personalTableView.delegate = self
        personalTableView.dataSource = self.personalisedDataSource
        searchButton.layer.cornerRadius  = 4
        self.menuDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.menuCollectionView.reloadData()
        }
        self.personalisedDataSource.data.addAndNotify(observer: self) { [weak self] _ in            self?.personalTableView.reloadData()
        }
        
    
        self.peronalViewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        self.viewModel.getMenuData()
        self.peronalViewModel.fetchNews()
        
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 150)
    }
}
extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}
extension HomeVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

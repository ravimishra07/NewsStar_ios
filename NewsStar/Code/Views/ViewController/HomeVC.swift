//
//  ViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit
\
class HomeVC: UIViewController {
    override class func description() -> String {
        "HomeVC"
    }
    //MARK:- Outlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var searchView: SoftUIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var personalTableView: UITableView!
    
    //MARK:- Variables
    let menuCellIdentifier = "MenuCVCell"
    let personCellIdentifier = "NewsTableViewCell"
    let menuDataSource = MenuDataSource()
    let personalisedDataSource = PersonalDataSource()
    var transAnimator:TransitionAnimator?
    var circleAnimator: CircleAnimator?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        animateMenuButton()
    }
    
    func setUpUI(){
        view.backgroundColor =  UIColor(named: "MainBackgroundColor")
        personalTableView.layer.cornerRadius = 12
        personalTableView.clipsToBounds = true
        self.menuCollectionView.register(UINib(nibName:"MenuCVCell", bundle: nil), forCellWithReuseIdentifier: menuCellIdentifier)
        self.personalTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.description())
        searchTextField.delegate = self
        menuCollectionView.dataSource = self.menuDataSource
        menuCollectionView.delegate = self
        personalTableView.delegate = self
        personalTableView.dataSource = self.personalisedDataSource
        searchButton.layer.cornerRadius  = 20
        self.menuDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.menuCollectionView.reloadData()
        }
        self.personalisedDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.personalTableView.reloadData()
        }
        self.peronalViewModel.onErrorHandling = { [weak self] error in
            // display error
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        self.viewModel.getMenuData()
        self.peronalViewModel.fetchNews(context: self)
        
    }
    func animateMenuButton(){
        let initTransform: CGFloat = 150
        
        //  (1st jump)move button to top
        menuButton.transform = CGAffineTransform(translationX: 0, y: -initTransform)
        UIView.animate(withDuration: 0.3, delay: 1) {
            //  1st jump to origin
            self.menuButton.transform = .identity
        } completion: { (isTrue) in
            if isTrue{
                UIView.animate(withDuration: 0.20, delay: 0) {
                    // (2st jump) move button up
                    self.menuButton.transform = CGAffineTransform(translationX: 0, y: -60)
                } completion: { (isTrue) in
                    if isTrue{
                        
                        UIView.animate(withDuration: 0.22) {
                            self.menuButton.transform = .identity
                            
                        } completion: { (isTrue) in
                            if isTrue{
                                //  (3rd jump) move button up
                                UIView.animate(withDuration: 0.18) {
                                    self.menuButton.transform = .identity
                                    
                                } completion: { (isTrue) in
                                    if isTrue{
                                        
                                        UIView.animate(withDuration: 0.14) {
                                            self.menuButton.transform = CGAffineTransform(translationX: 0, y: -15)
                                            
                                        } completion: { (isTrue) in
                                            if isTrue{
                                                // final jumo to origin
                                                UIView.animate(withDuration: 0.10) {
                                                    self.menuButton.transform = .identity
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    @IBAction func searchTapped(_ sender: UIButton){
        Global.searchText = searchTextField?.text ?? ""
        self.tabBarController?.selectedIndex = 1

//        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    @IBAction func menuTapped(){
        
        // animateMenuButton()
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: SideMenuController.description()) as? SideMenuController else {
            return
        }
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = peronalViewModel.dataSource?.data.value[indexPath.row].url else {
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: FullNewsVC.description()) as! FullNewsVC
        vc.newsUrl = url
        self.present(vc, animated: true, completion: nil)
    }
    
}
extension HomeVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}
extension HomeVC: UIViewControllerTransitioningDelegate{
    
    // MARK:- UIViewControllerTrasitioningDelegates method
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        circleAnimator = CircleAnimator(view: menuButton, color: .red, duration: 0.4)
        circleAnimator?.mode = .dismiss
        return circleAnimator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        circleAnimator = CircleAnimator(view: menuButton, color: .red, duration: 0.5)
        circleAnimator?.mode = .present
        return circleAnimator
    }
}

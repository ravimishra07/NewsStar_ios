//
//  SignInViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 13/12/20.
//

import UIKit
import GoogleSignIn
import Firebase
import liquid_swipe

class ColoredController: UIViewController {
    var viewColor: UIColor = .white {
        didSet {
            viewIfLoaded?.backgroundColor = viewColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor
    }
}

class SignInViewController: LiquidSwipeContainerController, LiquidSwipeContainerDataSource{
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var gradientLayer: MainGradientView!

    @IBOutlet weak var backView: SoftUIView!
    @IBOutlet weak var onBoardingCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    
    let cvDataSource = OnboardingDataSource()
    lazy var viewModel: OnboardingViewModel = {
        let vm = OnboardingViewModel(dataSource: cvDataSource)
        return vm
    }()
    
    
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page1")
        let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page2")
        var controllers: [UIViewController] = [firstPageVC, secondPageVC]
        let vcColors: [UIColor] = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 1, green: 0.3529352546, blue: 0.2339158952, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
        controllers.append(contentsOf: vcColors.map {
            let vc = ColoredController()
            vc.viewColor = $0
            return vc
        })
        return controllers
    }()
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        signinButton.titleLabel?.textColor = .black
        setupUI()
    }
    func setupUI(){
        //gradientLayer.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 80)
        dataSource = self
        onBoardingCV.delegate = self
        onBoardingCV.dataSource = cvDataSource
        self.cvDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.onBoardingCV.reloadData()
    }
        self.viewModel.getOnboardingData()
    }
    @IBAction func googleSignIn(sender: AnyObject) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
}
extension SignInViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width-12, height: 2*(self.view.bounds.height)/3)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row

    }
}
extension SignInViewController{
    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
        return viewControllers[index]
    }

}

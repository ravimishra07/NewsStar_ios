//
//  SignInViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 13/12/20.
//

import UIKit
import GoogleSignIn
import Firebase


class SignInViewController: UIViewController{
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
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.pageControl.currentPage = 0
        signinButton.titleLabel?.textColor = .black
        setupUI()
    }
    func setupUI(){
        //gradientLayer.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 80)
        //  datasource = self
        
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

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

    @IBOutlet weak var backView: SoftUIView!
    @IBOutlet weak var onBoardingCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var collectionViewWidth: CGFloat = 0
    private var indexOfCellBeforeDragging = 0
    private var animDuration = 0.25

    
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
        
        onBoardingCV.delegate = self
        onBoardingCV.dataSource = cvDataSource
        self.cvDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.onBoardingCV.reloadData()
    }
        DispatchQueue.main.async {
            let initialIndexPath = IndexPath(row: 1, section: 0)
            self.onBoardingCV.scrollToItem(at: initialIndexPath, at: .centeredHorizontally, animated: false)
            let cell = self.onBoardingCV.cellForItem(at: initialIndexPath)
            cell?.transform = CGAffineTransform.identity
        }
        self.viewModel.getOnboardingData()
        
        
    }
    /*
    // MARK:- scrollViewDelegates for the viewController
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfCell()
        UIView.animate(withDuration: animDuration, delay: 0, options: [.curveEaseOut]) {
            let cell = self.onBoardingCV.cellForItem(at: IndexPath(row: self.indexOfCellBeforeDragging, section: 0))
            cell?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } completion: { _ in  }

    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        /// we do not handle the cell animation for a scroll here. If it's > 0.5 we delegate the cell animation to scrollViewDidEndDecelerating method.
        if (velocity.x  <= 0.5) {
            let indexPath = IndexPath(row: self.indexOfCell(), section: 0)
            onBoardingCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            UIView.animate(withDuration: animDuration, delay: 0, options: [.curveEaseOut]) {
                let cell = self.onBoardingCV.cellForItem(at: indexPath) as? OnBoardingCVCell
                cell?.transform = CGAffineTransform.identity
            } completion: { _ in  }

           
        }
    }
    */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      //  let indexPath = IndexPath(row: self.indexOfCell(), section: 0)
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        /*
        onBoardingCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       
        let cell = onBoardingCV.cellForItem(at: indexPath)
        let visibleCells = onBoardingCV.visibleCells.filter({$0 != cell})
        visibleCells.forEach({$0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)})
        
        UIView.animate(withDuration: animDuration, delay: 0, options: [.curveEaseOut]) {
            let cell = self.onBoardingCV.cellForItem(at: indexPath) as? OnBoardingCVCell
            cell?.transform = CGAffineTransform.identity
      
        } completion: { _ in  }
        */
     
    }
    
    // MARK:- functions for the viewController
    func indexOfCell() -> Int {
        let cellWidth = collectionViewWidth
        let proportionalOffset = onBoardingCV.contentOffset.x / cellWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = onBoardingCV.numberOfItems(inSection: 0)
        let cellIndex = max(0, min(numberOfItems - 1, index))
        return cellIndex
    }
    @IBAction func googleSignIn(sender: AnyObject) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
}
extension SignInViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 1.1
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let adjustedWidth = (collectionViewWidth) - (flowLayout.minimumLineSpacing * (columns - 1))
        let width = floor(adjustedWidth / columns)
        self.collectionViewWidth = width
        return CGSize(width: width, height: 2*(self.view.bounds.height)/3)
        //return CGSize(width: self.view.bounds.width-12, height: 2*(self.view.bounds.height)/3)
    }
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        self.pageControl.currentPage = indexPath.row
//
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//    }
}

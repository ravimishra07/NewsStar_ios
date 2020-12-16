//
//  ChooseTopicVC.swift
//  NewsStar
//
//  Created by Ravi Mishra on 15/11/20.
//

import UIKit

class ChooseTopicVC: UIViewController {
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var preferenceCollectionView: UICollectionView!
    let prefDataSource = PreferenceDataSource()
    lazy var preferenceViewModel: PreferenceViewModel = {
        let viewModel = PreferenceViewModel(dataSource: prefDataSource)
        return viewModel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.preferenceCollectionView.delegate = self
        self.preferenceCollectionView.dataSource = prefDataSource
        self.prefDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.preferenceCollectionView.reloadData()
        }
        self.preferenceViewModel.fetechTopic()
            // self.prefDataSource.data.add
        
    }
    
}
extension ChooseTopicVC: UICollectionViewDelegate{
    
}

//
//  ViewController.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/08.
//

import UIKit
import SnapKit

enum SectionType {
    case main
}

class ViewController: UIViewController {
    private var menuCollectionView = MenuCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
        setupViews()
    }
}

private extension ViewController {
    func configureNavigation() {
        navigationItem.title = "관심종목"
    }
    
    func setupViews() {
        [
            menuCollectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}


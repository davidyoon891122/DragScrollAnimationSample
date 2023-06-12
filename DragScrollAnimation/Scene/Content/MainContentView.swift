//
//  MainContentView.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/12.
//

import UIKit
import SnapKit

final class MainContentView: UIView {
    private let firstHeaderView = FirstHeaderView()
    
    private let secondHeaderView = SecondHeaderView()
    
    private let stockListCollectionView = StockListCollectionView()
    
    private lazy var containverView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        [
            firstHeaderView,
            secondHeaderView,
            stockListCollectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        firstHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        secondHeaderView.snp.makeConstraints {
            $0.top.equalTo(firstHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(35.0)
        }
        
        stockListCollectionView.snp.makeConstraints {
            $0.top.equalTo(secondHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        stockListCollectionView.delegate = self
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainContentView: StockListCollectionViewDelegate {
    func didScroll(offset: CGPoint) {
        let offsetY = offset.y
        let height = 35 - (offsetY / 3)
        
        secondHeaderView.snp.updateConstraints {
            $0.height.equalTo(height > 0 ? height : 0)
        }
        
        if offsetY <= 0 {
            secondHeaderView.alpha = 1
            secondHeaderView.snp.updateConstraints {
                $0.height.equalTo(35.0)
            }
        } else {
            let alpha = 1 - (offsetY / 100)
            secondHeaderView.alpha = alpha > 0 ? alpha : 0
        }
    }
}

private extension MainContentView {
    func setupViews() {
        [
            containverView
        ]
            .forEach {
                addSubview($0)
            }
        
        containverView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

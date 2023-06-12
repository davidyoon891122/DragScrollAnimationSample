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
        view.backgroundColor = .orange
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
        }
        
        stockListCollectionView.snp.makeConstraints {
            $0.top.equalTo(secondHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
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

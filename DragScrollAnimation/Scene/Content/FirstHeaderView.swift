//
//  FirstHeaderView.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/12.
//

import UIKit
import SnapKit

final class FirstHeaderView: UIView {
    private lazy var marketTypeButton: UIButton = {
        let button = UIButton()
        button.setTitle("정규", for: .normal)
        
        
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        [
            marketTypeButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        marketTypeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset / 2)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-offset / 2)
            $0.width.equalTo(70)
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

private extension FirstHeaderView {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(35.0)
        }
    }
}

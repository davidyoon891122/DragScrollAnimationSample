//
//  MenuCollectionViewCell.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/08.
//

import UIKit
import SnapKit

final class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    
    private lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var underBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        
        view.isHidden = true
        
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            underBarView.isHidden = !isSelected
            if isSelected {
                menuTitleLabel.textColor = .label
            } else {
                menuTitleLabel.textColor = .gray
            }
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        [
            menuTitleLabel,
            underBarView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        menuTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        underBarView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
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
    
    func setupCell(menu: MenuModel) {
        menuTitleLabel.text = menu.menu
    }
}

private extension MenuCollectionViewCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}

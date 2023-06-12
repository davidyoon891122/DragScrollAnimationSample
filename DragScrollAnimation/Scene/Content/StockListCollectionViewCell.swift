//
//  StockListCollectionViewCell.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/12.
//

import UIKit
import SnapKit

final class StockListCollectionViewCell: UICollectionViewCell {
    static let identifier = "StockListCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Samsung"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "7.7100"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var changeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0300"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var changePercentLabel: UILabel = {
        let label = UILabel()
        label.text = "0.39%"
        label.textColor = .label
        
        return label
    }()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            titleLabel,
            priceLabel,
            changeValueLabel,
            changePercentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8.0)
            $0.leading.equalToSuperview().offset(8.0)
            $0.bottom.equalToSuperview().offset(-8.0)
            $0.width.lessThanOrEqualTo(100)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8.0)
        }
        
        changeValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(8.0)
        }
        
        changePercentLabel.snp.makeConstraints {
            $0.centerY.equalTo(changeValueLabel)
            $0.leading.equalTo(changeValueLabel.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().offset(-8.0).priority(.high)
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
    
    func setupCell(stockModel: StockInfoModel) {
        titleLabel.text = stockModel.name
        priceLabel.text = "\(stockModel.currentPrice)"
        changeValueLabel.text = "\(stockModel.changeValue)"
        changePercentLabel.text = "\(stockModel.changePercent)"
    }
}

private extension StockListCollectionViewCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


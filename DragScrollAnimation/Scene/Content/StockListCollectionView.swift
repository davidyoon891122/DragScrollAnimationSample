//
//  StockListCollectionView.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/12.
//

import UIKit
import SnapKit

final class StockListCollectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(StockListCollectionViewCell.self, forCellWithReuseIdentifier: StockListCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<Int, StockInfoModel>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDatasource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension StockListCollectionView {
    func setupViews() {
        [
            collectionView
        ]
            .forEach {
                addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<Int, StockInfoModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockListCollectionViewCell.identifier, for: indexPath) as? StockListCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setupCell(stockModel: item)
            
            return cell
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, StockInfoModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(StockInfoModel.stockInfoModel)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

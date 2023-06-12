//
//  MenuCollectionView.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/08.
//

import UIKit
import SnapKit

final class MenuCollectionView: UIView {
    private lazy var menuCollectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var selectGroupButton: UIButton = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .light)
        let image = UIImage(systemName: "chevron.left", withConfiguration: imageConfig)
        
        let button = UIButton(type: .roundedRect)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4
        
        button.tintColor = .label
        button.setImage(image, for: .normal)

        
        button.layer.shadowColor = UIColor.systemBackground.cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = .init(width: -5.0, height: 0.0)
        
        button.backgroundColor = .systemBackground
        
        
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            menuCollectionView,
            selectGroupButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        
        let offset: CGFloat = 16.0
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalTo(selectGroupButton.snp.leading)
            $0.bottom.equalToSuperview()
        }
        
        selectGroupButton.snp.makeConstraints {
            $0.centerY.equalTo(menuCollectionView)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.width.height.equalTo(30)
        }
        
        return view
    }()

    private var datasource: UICollectionViewDiffableDataSource<SectionType, MenuModel>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDatasource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        selectGroupButton.layer.shadowPath = UIBezierPath(roundedRect: selectGroupButton.bounds, cornerRadius: selectGroupButton.layer.cornerRadius).cgPath
    }
}

private extension MenuCollectionView {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(50.0)
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50.0), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(1.0), heightDimension: .absolute(50.0)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: menuCollectionView, cellProvider: { collectionView, indexPath, menuModel in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setupCell(menu: menuModel)
            
            return cell
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, MenuModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(MenuModel.menuItems)
        datasource.apply(snapshot, animatingDifferences: true)
        
        let indexPath = IndexPath(item: 0, section: 0)
        
        menuCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }
}

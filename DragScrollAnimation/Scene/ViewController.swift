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
    private lazy var menuCollectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var selectGroupButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        
        return button
    }()

    private var datasource: UICollectionViewDiffableDataSource<SectionType, MenuModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
        setupViews()
        configureDatasource()
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
        
        let offset: CGFloat = 16.0
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
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
    }
}


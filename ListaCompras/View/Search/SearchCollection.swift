//
//  SearchCollection.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 30/11/21.
//

import UIKit

class SearchCollection: UIView, UICollectionViewDelegate {

    private var viewController: UIViewController?
    
    struct CollectionData {
        let item: Item
    }

    // MARK: - Subviews

    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.cellId)
        return collection
    }()

    // MARK: - Properties

    private var collectionData = [CollectionData]()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private enum LayoutMetrics {
        static let leadingCarosel: CGFloat = 18
        static let heightCarosel: CGFloat = 410
    }
}

// MARK: - Setups

private extension SearchCollection {
    func setupUI() {
        backgroundColor = .clear
        setupCollectionView()
    }

    func setupCollectionView() {
        backgroundColor = UIColor(named: "backgroundColor")
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.sectionInset = .zero
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselLayout.scrollDirection = .vertical
        carouselCollectionView.showsVerticalScrollIndicator = false
        addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

    }
}

// MARK: - UICollectionViewDataSource

extension SearchCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellId, for: indexPath) as? SearchCollectionViewCell
        else { return UICollectionViewCell() }

        let item = collectionData[indexPath.row].item

        cell.configure(itemCard: item)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 170, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 15.0

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let controller = viewController
//        let nft = collectionData[indexPath.row].nft
//        let navigationController = UINavigationController(rootViewController:InformationNFTViewController(nftSelected: nft, view: typeView))
//        navigationController.modalPresentationStyle = .custom
//        controller!.present(navigationController, animated: true, completion: nil)
       
    }
}

// MARK: - Public

extension SearchCollection {
    public func configureView(with data: [CollectionData]) {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.sectionInset = alignmentRectInsets
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselLayout.scrollDirection = .vertical
        collectionData = data
        carouselCollectionView.reloadData()
    }
    
    public func loadData(){
        carouselCollectionView.reloadData()
    }
    
    public func takeViewController(view: UIViewController) {
        viewController = view
    }
}

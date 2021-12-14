//
//  SearchCollectionViewCell.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 30/11/21.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var item = UIView()
    static let cellId = "CarouselCell"

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups

private extension SearchCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear
    }
}

// MARK: - Public

extension SearchCollectionViewCell {
    public func configure(itemCard: Item) {
        item = ItemCardView(itemCard: itemCard)
        
        contentView.addSubview(item)
        item.isUserInteractionEnabled = false
        item.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
//    public func identifyNFT(nft: NFT){
//        nftSelected = nft
//    }

}

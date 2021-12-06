//
//  CartItem.swift
//  ListaCompras
//
//  Created by Ana Bittencourt Vidigal on 30/11/21.
//

import Foundation
import UIKit
import SnapKit

// Por convenção, classes (que tem maior hierarquia) são nomeadas começando com maiúscula
class CartItem: UIView {
    
    var componentCardStack: UIStackView = UIStackView()
    
    // Por convenção, variáveis (que tem menor hierarquia) começam com minúscula (camelCase)
    private lazy var itemDescriptionStack: UIStackView = {
        
        let itemTitle = UILabel()
        itemTitle.text = "Bell Pepper Red"
        itemTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        itemTitle.textColor = .black
        itemTitle.textAlignment = .left
        
        let itemDescription = UILabel()
        itemDescription.text = "1kg, Price"
        itemDescription.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        itemDescription.textColor = .gray
        itemDescription.textAlignment = .left
        
       
        
        let addQuantityButton: AddButton = .createButton(systemIcon: "plus")
        let subtractQuantityButton: AddButton = .createButton(systemIcon: "minus")
        
        let quantityLabel = UILabel()
        quantityLabel.text = "1"
        quantityLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        quantityLabel.textColor = .black
        quantityLabel.textAlignment = .center
        
        let insideMiddleStack = UIStackView(arrangedSubviews: [subtractQuantityButton, quantityLabel, addQuantityButton])
        insideMiddleStack.axis = .horizontal
        insideMiddleStack.spacing = 17
                
        let middleStack = UIStackView(arrangedSubviews: [itemTitle, itemDescription, insideMiddleStack])
        middleStack.axis = .vertical
        middleStack.spacing = 5
        
        return middleStack
        
    }()
    
    
    private lazy var priceStack: UIStackView = {
        
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteButton.tintColor = .gray
        
        
        let priceLabel = UILabel()
        priceLabel.text = "$4.99"
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .right
        
        
        let rightStack = UIStackView(arrangedSubviews: [deleteButton, priceLabel])
        rightStack.axis = .vertical
        rightStack.spacing = 50
        rightStack.alignment = .trailing
        
        return rightStack
        
        
    }()
    
    private lazy var itemImage: UIImageView = {
        let image = UIImage(named: "bellpepper")
        let itemImage = UIImageView(image: image)
        itemImage.frame = CGRect(x: 0, y: 0, width: 70, height: 64)
        itemImage.contentMode = .scaleAspectFit

        
    return itemImage
        
    }()

    private override init(frame: CGRect) {
        super.init(frame: frame)
        componentCardStack = UIStackView(arrangedSubviews: [self.itemImage, self.itemDescriptionStack, self.priceStack])
        componentCardStack.axis = .horizontal
        componentCardStack.spacing = 30
        setupHierarchy()
        setupConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(componentCardStack)
    }
    
    private func setupConstraints() {
        componentCardStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}


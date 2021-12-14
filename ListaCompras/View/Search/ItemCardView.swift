//
//  ItemCardView.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit
import SnapKit

class ItemCardView: UIView {
    
    private var item : Item

    
    private lazy var card: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.borderColor = UIColor.systemGray.cgColor
        card.layer.borderWidth = 1
        card.layer.cornerRadius = 15
        card.clipsToBounds = true
        
        return card
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = item.image
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    private lazy var productName : UILabel = {
        let name = UILabel()
        name.text = item.name
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.textColor = .black
        
        return name
    }()
    
    private lazy var quantity: UILabel = {
        let quantity = UILabel()
        quantity.text = "\(item.quantity) \(item.measure)"
        quantity.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        quantity.textColor = .systemGray2
        quantity.textAlignment = .left
        
        return quantity
    }()
    
    
    private lazy var stack: UIStackView = {
        let price = UILabel()
        price.text = "\(item.price)"
        price.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        price.textColor = .black
        price.textAlignment = .left
        
        
        let addButton: AddButton = .createButton()
        
        let stack = UIStackView(arrangedSubviews: [price, addButton])
        stack.axis = .horizontal
        stack.spacing = 46
        
        return stack
    }()
    
    init(itemCard: Item){
        self.item = itemCard
        super.init(frame: .zero)
        
        setupHierarchy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy(){
        self.addSubview(card)
        card.addSubview(image)
        card.addSubview(productName)
        card.addSubview(quantity)
        card.addSubview(stack)

    }
    
    private func setupConstraints(){
        card.snp.makeConstraints { make in
            make.height.equalTo(248)
            make.width.equalTo(174)
        }
        
        image.snp.makeConstraints { make in
            make.centerX.equalTo(card.snp.centerX)
            make.top.equalTo(10)
        }
        
        productName.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(18)
            make.leading.equalTo(card.snp.leading).offset(15)
            make.trailing.equalTo(card.snp.trailing).offset(-15)
        }
        
        quantity.snp.makeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(5)
            make.leading.equalTo(card.snp.leading).offset(15)
            make.trailing.equalTo(card.snp.trailing).offset(-15)
        }
        
        stack.snp.makeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(20)
            make.leading.equalTo(card.snp.leading).offset(15)
            make.trailing.equalTo(card.snp.trailing).offset(-15)
        }
    }
    
    
    
    
    
    

}

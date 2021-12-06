//
//  ViewController.swift
//  ListaCompras
//
//  Created by Geovanna Kasemirinski da Silva on 09/11/21.
//

import UIKit

class ViewController: UIViewController {

    private var itemCard : ItemCardView = .init()
    private var cartItem : CartItem = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupHierarchy()
        setupConstraints()
    }
    
    
    private func setupHierarchy(){
//        view.addSubview(itemCard)
        view.addSubview(cartItem)

    }
    
    private func setupConstraints(){
//        itemCard.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(130)
//            make.leading.equalToSuperview().offset(23)
//        }
    
        cartItem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(23)
        }
        
    }


}


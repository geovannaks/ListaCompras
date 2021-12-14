//
//  ViewController.swift
//  ListaCompras
//
//  Created by Geovanna Kasemirinski da Silva on 09/11/21.
//

import UIKit

class ViewController: UIViewController {

    private var itemCard : ItemCardView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupHierarchy()
        setupConstraints()
    }
    
    
    private func setupHierarchy(){
        view.addSubview(itemCard)

    }
    
    private func setupConstraints(){
        itemCard.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(23)
        }
    
    }


}


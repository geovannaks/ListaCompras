//
//  ViewController.swift
//  ListaCompras
//
//  Created by Geovanna Kasemirinski da Silva on 09/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var itens = Model().itens
    private var collectionView: SearchCollection = .init()
    private var collectionData = [SearchCollection.CollectionData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupHierarchy()
        setupConstraints()
        setupView()
        
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
    }
    
    private func setupView(){
        
        for item in itens {
            collectionData.append(.init(item: item))
        }
    }
    
    
    private func setupHierarchy(){
        view.addSubview(collectionView)

    }
    
    private func setupConstraints(){
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(130)
            make.height.equalTo(700)
        }
    
    }


}


//
//  AddButton.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit

class AddButton: UIButton {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createButton(systemIcon: String) -> AddButton {
        let button = AddButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 25, weight: .bold))
        
        button.setImage(UIImage(systemName: systemIcon, withConfiguration: configuration), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "green")
        button.layer.cornerRadius = 17

        
        button.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.width.equalTo(45)
            
        }
        
        return button
    }

}

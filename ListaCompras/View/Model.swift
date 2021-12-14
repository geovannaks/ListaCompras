//
//  Model.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 14/12/21.
//

import Foundation
import UIKit

class Model: ObservableObject {

    var itens: [Item] = [Item(image: UIImage(named: "ovos")!, name: "Eggs", price: 1.99, quantity: 12, measure: "pcs", detail: "nao"),
        Item(image: UIImage(named: "ovos")!, name: "Eggs", price: 1.99, quantity: 12, measure: "pcs", detail: "nao"),
        Item(image: UIImage(named: "ovos")!, name: "Eggs", price: 1.99, quantity: 12, measure: "pcs", detail: "nao"),
        Item(image: UIImage(named: "ovos")!, name: "Eggs", price: 1.99, quantity: 12, measure: "pcs", detail: "nao")
    ]


}

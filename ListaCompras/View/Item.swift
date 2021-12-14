//
//  Item.swift
//  ListaCompras
//
//  Created by Maria Luiza Amaral on 30/11/21.
//

import Foundation
import UIKit

struct Item: Identifiable {
    let id = UUID()
    let image: UIImage
    let name: String
    let price: Double
    let quantity: Double
    let measure: String
    let detail: String
}

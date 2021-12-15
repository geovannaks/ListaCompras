//
//  ItemConnection.swift
//  ListaCompras
//
//  Created by João Pedro Picolo on 15/12/21.
//

import CloudKit
import Foundation
import SwiftUI

struct ItemConnection {
    // MARK: - saving to CloudKit
    static func save(item: Item, completion: @escaping (Result<String, Error>) -> Void) {
        let record = CKRecord(recordType: "Item")
        record.setValue(item.name, forKey: "name")
        record.setValue(item.price, forKey: "price")
        record.setValue(item.measure, forKey: "measure")
        record.setValue(item.detail, forKey: "detail")
        record.setValue(item.quantity, forKey: "quantity")
        record.setValue(item.image, forKey: "image")
        
        CKContainer.default().publicCloudDatabase.save(record) { record, err in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard record != nil else {
                    print("Failed")
                    return
                }
                
                completion(.success("Saved succesfully"))
            }
        }
    }
}

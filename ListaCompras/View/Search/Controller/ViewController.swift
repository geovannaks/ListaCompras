//
//  ViewController.swift
//  ListaCompras
//
//  Created by Geovanna Kasemirinski da Silva on 09/11/21.
//

import UIKit
import SnapKit
import CloudKit

class ViewController: UIViewController {
    
    private var itens = Model().itens
    private var collectionView: SearchCollection = .init()
    private var collectionData = [SearchCollection.CollectionData]()
    
    let privateDatabase = CKContainer(identifier: "iCloud.containerListaCompras").privateCloudDatabase
    
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
protocol ItemDelegate {
    func createNewItem(name: String, price: Double, quantity: Double, measure: String, detail: String, image: UIImage)
}

extension ViewController: ItemDelegate {
    
    func createNewItem(name: String, price: Double, quantity: Double, measure: String, detail: String, image: UIImage){
        
        let predicate = NSPredicate(format: "name == %@", name)
        
        let query = CKQuery(recordType: "Item", predicate: predicate)
        
        
        let operation = CKQueryOperation(query: query)
        
        var existed = false
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                existed = true
                
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            DispatchQueue.main.async {
                
                if existed{
                    let alert = UIAlertController(title: "Atenção", message: "Já existe um usuário com este nome na nuvem.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
                        //chamar essa funcao de novo
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert,animated: true, completion: nil)
                }
                else{
                    let record = CKRecord(recordType: "Item")
                    record.setValue(name, forKey: "name")
                    record.setValue(price, forKey: "price")
                    record.setValue(measure, forKey: "measure")
                    record.setValue(detail, forKey: "detail")
                    record.setValue(quantity, forKey: "quantity")
                    record.setValue(image, forKey: "image")
                    
                    self.privateDatabase.save(record) { (savedRecord, error) in
                        DispatchQueue.main.async {
                            
                            if error == nil {
                                print("ta errrado meu")
                            } else {
                                print(error)
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
            
        }
        
        privateDatabase.add(operation)
        
        
    }

}

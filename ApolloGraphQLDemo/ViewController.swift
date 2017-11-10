//
//  ViewController.swift
//  ApolloGraphClientDemo
//
//  Created by Danh Dang on 11/1/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import UIKit
import Apollo
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var products = [ZProduct]()
    var productWatcher: GraphQLQueryWatcher<GetProductQuery>?
    
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        return adapter
    }()
    
    fileprivate let spacing: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        }
        loadMockData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func loadMockData() {
        let allProducts = GetProductQuery()
        productWatcher = apollo.watch(query: allProducts) { [weak self] result, error in
            guard error == nil,
                let products = result?.data?.productList?.products else {
                    print(error?.localizedDescription ?? "Error loading products")
                    return
            }
            self?.products = products.flatMap() { ZProduct($0!) }
            self?.adapter.reloadData(completion: nil)
        }
    }
}

extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [ZProductList(products)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ProductSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let emptyView = UIView()
        emptyView.backgroundColor = .black
        return emptyView
    }
}




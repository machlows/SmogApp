//
//  IndexesViewController.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import Foundation
import UIKit

class IndexesViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var currentStationId : Int!
    var indexesModel: IndexesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllIndexes()
    }
    
    func getAllIndexes() {
        ApiClient.shared.getIndexes(for: currentStationId).then { [weak self] result -> Void in
            self?.indexesModel = result
            self?.collectionView.reloadData()
            }.catch { error in
                print(error.localizedDescription)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section == 0, let indexesModel = indexesModel else { return 0 }
        return indexesModel.indexes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "indexCell", for: indexPath) as? IndexCollectionViewCell, let indexesModel = indexesModel else { return UICollectionViewCell() }
        cell.configure(with: IndexViewModel(with: indexesModel.indexes[indexPath.row]))
        return cell
    }
}

//
//  ViewController.swift
//  collectionHorVer
//
//  Created by Hamza Mustafa on 14/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let fastCellId = "fastCollectionViewCell"
    var fastProducts = [FastModel]()
    let fastImgsArray = [ #imageLiteral(resourceName: "1") ,#imageLiteral(resourceName: "2") ,#imageLiteral(resourceName: "1") ,#imageLiteral(resourceName: "2") ,#imageLiteral(resourceName: "1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nibCell = UINib(nibName: fastCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: fastCellId)
        
        for index in 1...5 {
            let product = FastModel()
            product?.title = "Biryani \(index)"
            fastProducts.append(product!)
        }
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fastProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fastCellId, for: indexPath) as! fastCollectionViewCell
        let product = fastProducts[indexPath.row]
        cell.imgData.image = fastImgsArray[indexPath.row]
        cell.imgTitle.text = product.title
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}

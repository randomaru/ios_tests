//
//  ViewController.swift
//  TestRatingWidget
//
//  Created by out-belyayeva-ma on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var collectionView : UICollectionView?
//    var itemMenuArray: [Any] = {
//
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "itemCell")
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
//        itemCell.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
//        let catImageView = UIImageView(image: UIImage(named: "cat-1.jpg"))
//        itemCell.addSubview(catImageView)
//        catImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            catImageView.leftAnchor.constraint(equalTo: itemCell.leftAnchor),
//            catImageView.widthAnchor.constraint(equalTo: itemCell.widthAnchor),
//            catImageView.heightAnchor.constraint(equalTo: itemCell.heightAnchor)
//        ])
		let catButton = UIButton()
		catButton.setImage(UIImage(named: "cat-1.jpg"), for: .normal)
		catButton.setTitle("lala", for: .normal)
		catButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		itemCell.addSubview(catButton)
		catButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			catButton.widthAnchor.constraint(equalToConstant: 50),
			catButton.heightAnchor.constraint(equalToConstant: 50)
		])
        return itemCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
    
    
}


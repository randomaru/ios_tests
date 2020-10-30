//
//  ViewController.swift
//  UIScrollView
//
//  Created by out-belyayeva-ma on 29.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    var imageView = UIImageView()
    let imageOne = UIImage(named: "cat-1")
    let imageTwo = UIImage(named: "cat-2")
    let imageThree = UIImage(named: "cat-3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: imageOne)
        
        setScrollView()
    }
    
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Начинается прокрутка")
        print(scrollView.contentOffset.x)
        self.scrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Прокрутка закончена")
        self.scrollView.alpha = 1.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("Гарантируем что вернем альфу к нормальному состоянию")
        self.scrollView.alpha = 1.0
    }
    
    
    private func setScrollView() {
        scrollView.indicatorStyle = .white
        scrollView.delegate = self
//        scrollView.contentSize = imageView.bounds.size
//        scrollView.isScrollEnabled = true
//        scrollView.addSubview(imageView)
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.bounds.width * 3, height: view.bounds.height)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        var imageViewRect = view.bounds
        let catOneImageView = newImageViewWithImage(paramImage: imageOne!, paramFrame: imageViewRect)
        scrollView.addSubview(catOneImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let catTwoImageView = newImageViewWithImage(paramImage: imageTwo!, paramFrame: imageViewRect)
        scrollView.addSubview(catTwoImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let catThreeImageView = newImageViewWithImage(paramImage: imageThree!, paramFrame: imageViewRect)
        scrollView.addSubview(catThreeImageView)
    }

}


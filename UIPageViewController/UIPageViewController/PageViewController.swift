//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by out-belyayeva-ma on 02.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    //MARK: Variable
    var cars = [CarsHelper]()
    let carCop = UIImage(named: "car-cop")
    let carLady = UIImage(named: "car-lady")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        let firstCar = CarsHelper(name: "Cop", image: carCop!)
        let secondCar = CarsHelper(name: "Lady", image: carLady!)
        
        cars.append(firstCar)
        cars.append(secondCar)
    }
    
    lazy var arrayCarViewControler: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in self.cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    //MARK: Init UIPageViewConroller
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarViewControler[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let newViewConroller = viewController as? CarViewController else {return nil}
        if let index = arrayCarViewControler.index(of: newViewConroller) {
            if index > 0 {
                return arrayCarViewControler[index - 1]
                
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let newViewConroller = viewController as? CarViewController else {return nil}
        if let index = arrayCarViewControler.index(of: newViewConroller) {
            if index < cars.count - 1 {
                return arrayCarViewControler[index + 1]
                
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

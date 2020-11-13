//
//  ViewController.swift
//  UIViewControllerLifecycle
//
//  Created by out-belyayeva-ma on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {

	let button = UIButton()
	let secondVC = SecondVCViewController()
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//
	override func loadView() {
		super.loadView()
		print("loadView")
	}
	
	//вызывается сразу после того, как view ViewController загрузилось
	//View создана и загружена в память. Но границы view еще не определены.
	//Инициализация объектов которые viewcontroller будет использовать.
 	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		print("viewDidLoad")
	}
	
	//Срабатывает при нехватке памяти
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	//срабатывает перед появлением вью на экране
	//вью скоро выведется на экран, оно еще не видно пользователю
	//уже загружено в память, но еще не видно
	//часто здесь подтягивают что-то из интернета, вибрация девайса (?)
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("viewWillAppear")
	}
	
	//Срабатывает перед тем как размер вью поменяется под размер экрана
	override func viewWillLayoutSubviews() {
		print("viewWillLayoutSubviews")
	}
	
	//Срабатывает после того как размер вью изменился под размер экрана
	override func viewDidLayoutSubviews() {
		print("viewDidLayoutSubviews")
	}
	//add subviews, show spinner
	//Срабатывает после появления вью на экране
	//стартуем анимацию (потому что экран уже появился)
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print("viewDidAppear")
		
		button.setTitle("next", for: .normal)
		view.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
	}
	
	//срабатывает после поворота экрана
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		print("viewWillTransition")
	}
	
	//вью будет закрыто
	//останавливаем анимациюё
	//можно провести чистку экрана/данных
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		print("viewWillDisappear")
	}
	
	//после того как вью закрылся
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print("viewDidDisappear")
	}

	//выгружает объект из памяти
	deinit {
		print("deinit")
	}
	
	@objc private func goNext() {
//		present(secondVC, animated: true, completion: nil)
		navigationController?.pushViewController(secondVC, animated: true)
		
	}
}


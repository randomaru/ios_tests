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
	let willAppearLabel = UILabel()
	let didAppearLabel = UILabel()
	let willDisappearLabel = UILabel()
	let didDisappearLabel = UILabel()
	let viewWillLayoutSubviewsLabel = UILabel()
	let viewDidLayoutSubviewsLabel = UILabel()


	var willAppear = 0
	var didAppear = 0
	var willDisappear = 0
	var didDisappear = 0
	var viewWillLayout = 0
	var viewDidLayout = 0


	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nil, bundle: nil)
		print("Init")
	}


	/// <#Description#>
	/// - Parameter coder: <#coder description#>
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	//тоже для сториборда
	//все объекты из ниб загруженны
	//но загрузка вью только после первого обращения к ней
	override func awakeFromNib() {
		super.awakeFromNib()

	}
	
	//Загрузка и установка корневой вью из соответствующего ниб файла
	//можно вручную создать вью и установить в качестве корневой для вью контроллера
	override func loadView() {
		super.loadView()
		print("loadView")

		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
		self.view = view
	}
	
	//вызывается сразу после того, как view ViewController загрузилось
	//View создана и загружена в память.
	//Инициализация объектов которые viewcontroller будет использовать.
 	override func viewDidLoad() {
		super.viewDidLoad()
//		view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		print("viewDidLoad")

		setButton()
		addLabels()
	}

	private func setButton() {
		view.addSubview(button)
		button.setTitle("nextVC", for: .normal)
		button.addTarget(self, action: #selector(goToNextVC), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}

	@objc private func goToNextVC() {
		self.navigationController?.pushViewController(secondVC, animated: true)
	}

	//Срабатывает при нехватке памяти
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	//срабатывает перед появлением вью на экране
	//каждый раз при попытке отображения вью вьюконтроллера
	//вью скоро выведется на экран, оно еще не видно пользователю
	//уже загружено в память, но еще не видно
	//часто здесь подтягивают что-то из интернета, вибрация девайса (?)
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("viewWillAppear")
		willAppear += 1
		willAppearLabel.text = "viewWillAppear - \(willAppear)"
	}
	
	//Срабатывает перед тем как размер вью поменяется под размер экрана
	override func viewWillLayoutSubviews() {
		print("viewWillLayoutSubviews")
		viewWillLayout += 1
		viewWillLayoutSubviewsLabel.text = "viewWillLayoutSubviews - \(viewWillLayout)"
	}
	
	//Срабатывает после того как размер вью изменился под размер экрана
	override func viewDidLayoutSubviews() {
		print("viewDidLayoutSubviews")
		viewDidLayout += 1
		viewDidLayoutSubviewsLabel.text = "viewDidLayoutSubviews - \(viewDidLayout)"
	}
	//add subviews, show spinner
	//Срабатывает после появления вью на экране
	//стартуем анимацию (потому что экран уже появился)
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print("viewDidAppear")

	
		didAppear += 1
		didAppearLabel.text = "viewDidAppear - \(didAppear)"
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

		willDisappear += 1
		willDisappearLabel.text = "viewWillDisappear - \(willDisappear)"
	}
	
	//после того как вью закрылся
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print("viewDidDisappear")

		didDisappear += 1
		didDisappearLabel.text = "viewDidDisappear - \(didDisappear)"
	}

	//выгружает объект из памяти
	deinit {
		print("deinit")
	}

	private func addLabels() {
		willAppearLabel.text = "viewWillAppear - \(willAppear)"
		view.addSubview(willAppearLabel)
		willAppearLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			willAppearLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			willAppearLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
		])

		didAppearLabel.text = "viewDidAppear - \(didAppear)"
		view.addSubview(didAppearLabel)
		didAppearLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			didAppearLabel.topAnchor.constraint(equalTo: willAppearLabel.bottomAnchor, constant: 10),
			didAppearLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
		])

		willDisappearLabel.text = "viewWillDisappear - \(willDisappear)"
		view.addSubview(willDisappearLabel)
		willDisappearLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			willDisappearLabel.topAnchor.constraint(equalTo: didAppearLabel.bottomAnchor, constant: 10),
			willDisappearLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
		])

		didDisappearLabel.text = "viewDidDisappear - \(didDisappear)"
		view.addSubview(didDisappearLabel)
		didDisappearLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			didDisappearLabel.topAnchor.constraint(equalTo: willDisappearLabel.bottomAnchor, constant: 10),
			didDisappearLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
		])

		viewWillLayoutSubviewsLabel.text = "viewWillLayoutSubviews - \(viewWillLayout)"
		view.addSubview(viewWillLayoutSubviewsLabel)
		viewWillLayoutSubviewsLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			viewWillLayoutSubviewsLabel.topAnchor.constraint(equalTo: didDisappearLabel.bottomAnchor, constant: 10),
			viewWillLayoutSubviewsLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
		])
	}
}


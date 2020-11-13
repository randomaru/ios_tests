//
//  ViewController.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 11.11.2020.
//

import UIKit

class ViewController: UIViewController {

	let stackView = UIStackView()
	var buttons = [CatButton]()
	var selectedButton = 0
	
	let catImages: [String: UIImage?] = ["unselected": UIImage(named: "unselectedStar"), "selected": UIImage(named: "selectedStar")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		
		setStackView()
		addButtonsToSV()
	}
	
	private func addButtonsToSV() {
		for i in 0...4 {
			buttons.append(setButton(index: i))
		}
		print(buttons)
		for button in buttons {
			stackView.addArrangedSubview(button)
			setButtonConstrains(button: button)
		}
	}
	
	private func setStackView() {
		view.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		stackView.backgroundColor = .clear
		let stackViewConstraints: [NSLayoutConstraint] = [
			stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 20),
			stackView.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: 20)
		]
		NSLayoutConstraint.activate(stackViewConstraints)
	}

	private func setButton(index i: Int) -> CatButton {
		let catButton = CatButton(index: i)
		catButton.setImage(catImages["unselected"]!, for: .normal)
		
//		catButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
		catButton.setTitleColor(.clear, for: .normal)
		catButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
		catButton.imageView?.contentMode = .scaleAspectFit
//		catButton.addTarget(self, action: #selector(changeSelectedValue(button:)), for: .touchUpInside)
		catButton.addTarget(self, action: #selector(setSelected(sender:)), for: .touchUpInside)
		return catButton
	}
	
	@objc private func changeSelectedValue(button: CatButton) {
		selectedButton = button.index
		for button in buttons {
			if 0...selectedButton ~= button.index {
				if button.currentImage == catImages["unselected"]! {
					button.setImage(catImages["selected"]!, for: .normal)
				}
			} else {
				if button.currentImage == catImages["selected"]! {
					button.setImage(catImages["unselected"]!, for: .normal)
				}
			}
		}
	}

	@objc private func setSelected(sender: CatButton) {
		sender.isSelected = true
		
		for (i, button) in buttons.enumerated() {
			if !button.isSelected && button.currentImage == catImages["unselected"] {
				button.setImage(catImages["selected"]!, for: .normal)
			}
			if button.isSelected {
				if button.currentImage == catImages["unselected"] {
					button.setImage(catImages["selected"]!, for: .normal)
				}
				selectedButton = i
				button.isSelected = false
				break
			}
		}
		for (i, button) in buttons.enumerated() where selectedButton + 1..<buttons.count ~= i {
			if button.currentImage == catImages["selected"] {
				button.setImage(catImages["unselected"]!, for: .normal)
			}
		}
	}
	
	private func setButtonConstrains(button: CatButton) {
		button.translatesAutoresizingMaskIntoConstraints = false
		let buttonConstraints: [NSLayoutConstraint] = [
			button.widthAnchor.constraint(equalToConstant: 44),
			button.heightAnchor.constraint(equalToConstant: 44)
		]
		NSLayoutConstraint.activate(buttonConstraints)
	}

}



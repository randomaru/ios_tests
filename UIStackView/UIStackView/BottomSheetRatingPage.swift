//
//  BottomSheetRatingPage.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 25.11.2020.
//

import UIKit

final class BottomSheetRatingPage: UIView {

	var pageIndex: Int = 0
	let textBackground: UIView = UIView()
	let text: UILabel = UILabel()
//	var height: CGFloat = 0
	var height = NSLayoutDimension()
	let target: ButtonsRatingFormCell
	var selectedButtonIndex: Int = 0

	private let buttonsStackView: UIStackView = UIStackView()
	private var buttons: [UIButton] = []
	private let starsQuantity = 5

	private struct Constraints {
		enum Question {
			static let top: CGFloat = 12
			static let bottom: CGFloat = 111
			static let sideOffset: CGFloat = 16
		}
		enum Rating {
			static let top: CGFloat = 28
			static let height: CGFloat = 44
		}
		enum PageControl {
			static let top: CGFloat = 28
			static let bottom: CGFloat = -16
			static let width: CGFloat = 51
		}
	}

	init(pageIndex: Int,
		 text: String,
		 target: ButtonsRatingFormCell) {
		self.pageIndex = pageIndex
		self.text.text = text
		self.target = target
		super.init(frame: .zero)
		configurePage()
	}

	required init?(coder: NSCoder) {
		self.target = ButtonsRatingFormCell()
		super.init(coder: coder)
		configurePage()
	}

	private func configurePage() {
		textBackground.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
		text.numberOfLines = 0
		text.textAlignment = .center
		backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)

		setTextConstraints()
		setTextBackgroundConstraints()
		setButonsStackView()
		height = self.heightAnchor
	}

	private func setTextConstraints() {
		textBackground.addSubview(text)
		text.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			text.topAnchor.constraint(equalTo: textBackground.topAnchor),
			text.leftAnchor.constraint(equalTo: textBackground.leftAnchor),
			text.rightAnchor.constraint(equalTo: textBackground.rightAnchor),
			text.bottomAnchor.constraint(lessThanOrEqualTo: textBackground.bottomAnchor)
		])
	}
	private func setTextBackgroundConstraints() {
		addSubview(textBackground)
		textBackground.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			textBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: Constraints.Question.top),
			textBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constraints.Question.sideOffset),
			textBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constraints.Question.sideOffset),
			textBackground.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -Constraints.Question.bottom)
		])
	}

	private func setButonsStackView() {
		buttonsStackView.axis = .horizontal
		buttonsStackView.alignment = .center
		buttonsStackView.distribution = .equalSpacing
		buttonsStackView.spacing = 4
		buttonsStackView.backgroundColor = .clear

		self.addSubview(buttonsStackView)
		buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			buttonsStackView.topAnchor.constraint(equalTo: textBackground.bottomAnchor,
												constant: Constraints.Rating.top),
			buttonsStackView.heightAnchor.constraint(equalToConstant: Constraints.Rating.height),
			buttonsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
		])
		addButtonsToStackView()
	}

	private func addButtonsToStackView() {
		for index in 0..<starsQuantity {
			buttons.append(setButton(index: index))
		}
		for button in buttons {
			buttonsStackView.addArrangedSubview(button)
			setButtonConstraints(button: button)
		}
	}

	private func setButton(index: Int) -> UIButton {
		let button = UIButton()
		button.tag = index
		button.backgroundColor = .clear
		button.setImage(UIImage.stars.unselectedStar, for: .normal)
		button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
		button.imageView?.contentMode = .scaleAspectFit
		button.addTarget(self, action: #selector(changeSelectedValue(button:)), for: .touchUpInside)
		button.addTarget(target,
						 action: #selector(target.scrollToNextPage),
						 for: .touchUpInside)
		return button
	}

	@objc private func changeSelectedValue(button: UIButton) {
		selectedButtonIndex = button.tag
		for button in buttons {
			if button.tag > selectedButtonIndex
				&& button.currentImage == UIImage.stars.selectedStar {
				button.setImage(UIImage.stars.unselectedStar, for: .normal)
			} else if button.tag <= selectedButtonIndex
						&& button.currentImage == UIImage.stars.unselectedStar {
				button.setImage(UIImage.stars.selectedStar, for: .normal)
			}
		}
	}

	private func setButtonConstraints(button: UIButton) {
		button.translatesAutoresizingMaskIntoConstraints = false
		let buttonConstraints: [NSLayoutConstraint] = [
			button.widthAnchor.constraint(equalToConstant: 44),
			button.heightAnchor.constraint(equalToConstant: 44),
			button.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
			button.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor)
		]
		NSLayoutConstraint.activate(buttonConstraints)
	}
}

extension BottomSheetRatingPage {

	func estimatedHeightOfLabel(text: String) -> CGFloat {
		let size = CGSize(width: self.frame.width - 16, height: 1000)
		let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
		let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
		let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
		return rectangleHeight
	}
}

//
//  Cell.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 24.11.2020.
//

import UIKit

class ButtonsRatingFormCell: UITableViewCell {

	var pages: [BottomSheetRatingPage] = []

	var selectedButton: [Int] = []
	var buttons: [[UIButton]] = []
	//private var contentHeight: [CGFloat] = [300, 200, 400, 500, 100, 100] //NSLayoutDimension CGFloat [NSLayoutDimension] = []//
	private var setContentHeightConstraint = NSLayoutDimension()

	let buttonsStackView = UIStackView()
	let pagesStackView = UIStackView()
	let scrollView = UIScrollView()
	private var pageControl = UIPageControl()
	let questions = ["first",
					 "second startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал end",
					 "third startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал end",
					 "fourth",
					 "fifth",
					 "sixth"]
	var starsQuantity = 5 //под вопросом!!!!

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

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.configureAll()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.configureAll()
	}

	func configureAll() {
		self.selectedButton = Array(repeating: 0, count: questions.count)
		self.pageControl.numberOfPages = self.questions.count
		self.contentView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//		self.contentHeight = Array(repeating: 0, count: questions.count)

		setScrollView()
		setPagesStackView()
		setPageControl()
	}

	private func setScrollView() {
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.isPagingEnabled = true
		scrollView.backgroundColor = .clear
		scrollView.delegate = self

		contentView.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
		setContentHeightConstraint = contentView.heightAnchor ////////////////////////////////////////////////////////////////////
//		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.heightAnchor.constraint(equalTo: setContentHeightConstraint).isActive = true
	}

	private func setPagesStackView() {
		pagesStackView.translatesAutoresizingMaskIntoConstraints = false
//		pagesStackView.distribution = .equalSpacing
		pagesStackView.distribution = .fillProportionally

		scrollView.addSubview(pagesStackView)
		NSLayoutConstraint.activate([
			pagesStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			pagesStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			pagesStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
		])
		addPagesOnStackView()
	}

	private func addPagesOnStackView() {
		for index in 0..<questions.count {
			let page = BottomSheetRatingPage(pageIndex: index, text: questions[index], target: self)
			page.backgroundColor = .random()

			pagesStackView.addArrangedSubview(page)
			page.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				page.heightAnchor.constraint(equalTo: contentView.heightAnchor),
				page.widthAnchor.constraint(equalTo: contentView.widthAnchor)
			])
			pages.append(page)
		}
	}

	func estimatedHeightOfLabel(text: String) -> CGFloat {
		let size = CGSize(width: contentView.frame.width - 16, height: 1000)
		let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
		let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
		let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
		return rectangleHeight
	}

	private func setPageControl() {
		pageControl.backgroundColor = .clear
		pageControl.numberOfPages = questions.count
		pageControl.addTarget(self, action: #selector(pageControllTapped(sender:)), for: .valueChanged)

		contentView.addSubview(pageControl)
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			pageControl.centerYAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
		])

	}
	@objc private func pageControllTapped(sender: UIPageControl) {
		let pageWidth = scrollView.bounds.width
		let offset = sender.currentPage * Int(pageWidth)
		UIView.animate(withDuration: 0.33, animations: { [weak self] in
			self?.scrollView.contentOffset.x = CGFloat(offset)
		})
	}

	@objc func scrollToNextPage() {
		if pageControl.currentPage < questions.count - 1 {
			pageControl.currentPage += 1
			scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x + scrollView.frame.size.width, y: 0),
										animated: true)
		}
		 if contentView.heightAnchor.constraint(equalTo: setContentHeightConstraint).isActive {
			contentView.heightAnchor.constraint(equalTo: setContentHeightConstraint).isActive = false

		}
//		setContentHeightConstraint = contentHeight[pageControl.currentPage]
//		contentView.heightAnchor.constraint(equalTo: setContentHeightConstraint).isActive = true
//		contentView.updateConstraints()
	}

	private func setStackViewConstraints() {
		let constraints: [NSLayoutConstraint] = [
			buttonsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			buttonsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
			buttonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			buttonsStackView.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor, constant: 20),
			buttonsStackView.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: 20),
			buttonsStackView.heightAnchor.constraint(equalToConstant: 60)
		]
		NSLayoutConstraint.activate(constraints)
	}
}

extension ButtonsRatingFormCell: UIScrollViewDelegate {

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let screenWidth = UIScreen.main.bounds.width
		let offsetX = scrollView.contentOffset.x
		pageControl.currentPage = Int(offsetX / screenWidth)
	}
}

extension CGFloat {
	static func random() -> CGFloat {
		return CGFloat(arc4random()) / CGFloat(UInt32.max)
	}
}

extension UIColor {
	static func random() -> UIColor {
		return UIColor(
			red: .random(),
			green: .random(),
			blue: .random(),
			alpha: 1.0
		)
	}
}

extension UIImage {

	enum stars {
		static let unselectedStar =  UIImage(named: "unselectedStar")
		static let selectedStar = UIImage(named: "selectedStar")
	}
}

//
//  TestCell.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 26.11.2020.
//

import UIKit

class TestCell: UITableViewCell {

	let scrollView = UIScrollView()
	let pageControl = UIPageControl()
	var tableView: UITableView?
	let questions = ["first",
					 "second startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал end",
					 "third startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала ",
					 "fourth"]
	var pages: [BottomSheetRatingPage] = []

	lazy var heightConstraint = scrollView.heightAnchor.constraint(equalToConstant: pages[0].height)


	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setPages()
		contentView.backgroundColor = .red
		scrollView.delegate = self

		contentView.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			heightConstraint
		])
		scrollView.isPagingEnabled = true
		scrollView.contentSize.width = UIScreen.main.bounds.width * CGFloat(questions.count)
		scrollView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
		setPageControl()
//		setPages()
		addPagesOnScrollView()
	}

	private func addPagesOnScrollView() {
		for i in 0..<pages.count {
			scrollView.addSubview(pages[i])
			pages[i].frame = CGRect(x: i * Int(UIScreen.main.bounds.width), y: 0,
									width: Int(UIScreen.main.bounds.width), height: Int(pages[i].height))
		}
	}

	private func setPages() {
		for i in 0..<questions.count {
			let page = BottomSheetRatingPage(pageIndex: i,
											 text: questions[i],
											 target: ButtonsRatingFormCell())
			page.backgroundColor = .random()
			pages.append(page)
		}
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
//		if sender.currentPage % 2 == 0 {
//			heightConstraint.constant = 300
//		} else {
//			heightConstraint.constant = 100
//		}
		heightConstraint.constant = pages[sender.currentPage].height
		tableView?.beginUpdates()
		tableView?.endUpdates()
		UIView.animate(withDuration: 0.33, animations: { [weak self] in
			self?.scrollView.contentOffset.x = CGFloat(offset)
		})
		

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

extension TestCell: UIScrollViewDelegate {

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let screenWidth = UIScreen.main.bounds.width
		let offsetX = scrollView.contentOffset.x
		let page = Int(offsetX / screenWidth)
		if page != pageControl.currentPage {
//			if page % 2 == 0 {
//				heightConstraint.constant = 300
//			} else {
//				heightConstraint.constant = 100
//			}
			heightConstraint.constant = pages[page].height
			pageControl.currentPage = page
			tableView?.beginUpdates()
			tableView?.endUpdates()
		}
	}
}

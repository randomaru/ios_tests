//
//  ViewController.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 11.11.2020.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

		let questions = ["firsthird startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал endt",
						 "second",
						 "third startquestion ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываыва question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал лала лакеиапвпвпупаывасываываfirst question ла ла лалалал лалалал end",
						 "fourth",
						 "fifth",
						 "sixth"]

		let page = BottomSheetRatingPage(pageIndex: 0, text: questions[0], target: ButtonsRatingFormCell())

		view.addSubview(page)
		page.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			page.leftAnchor.constraint(equalTo: view.leftAnchor),
			page.rightAnchor.constraint(equalTo: view.rightAnchor),
			page.topAnchor.constraint(equalTo: view.topAnchor)
		])
	}
}

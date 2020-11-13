//
//  CatButton.swift
//  UIStackView
//
//  Created by out-belyayeva-ma on 12.11.2020.
//

import UIKit

class CatButton: UIButton {
	
	let index: Int
	
	init(index: Int) {
		self.index = index
		super.init(frame: .zero)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

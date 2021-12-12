//
//  RoundedView.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

class RoundedView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}

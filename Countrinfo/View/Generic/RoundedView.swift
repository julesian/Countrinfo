//
//  RoundedView.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

class RoundedImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}

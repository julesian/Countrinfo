//
//  CountryItemTableViewCell.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit
import Kingfisher

class CountryItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: CountryItemViewModel?
    
    enum Constants {
        static let identifier = "CountryItemTableViewCell"
    }
    
    public func setup(with viewModel: CountryItemViewModel) {
        self.viewModel = viewModel
        flagImageView.kf.setImage(with: viewModel.flagURL,
                                  placeholder: viewModel.placeHolderFlag)
        nameLabel.text = viewModel.name
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


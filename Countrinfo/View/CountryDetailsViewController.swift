//
//  CountryDetailsViewController.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CountryDetailsViewController: UIViewController {
    private var viewModel: CountryDetailsViewModel!
    let disposeBag = DisposeBag()
    var coordinator: AppCoordinator?
    
    enum Constants {
        static let storyboard = "Country"
        static let viewControllerIdentifier = "Country Details"
    }
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var flagBackgroundImageView: UIImageView!
    // @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var officialNameLabel: UILabel!
    @IBOutlet weak var commonNameLabel: UILabel!
    
    
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var populationFlairLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var capitalInfoLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageInfoLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var unFlagImageView: UIImageView!
    static func instantiate(with viewModel: CountryDetailsViewModel) -> CountryDetailsViewController {
        let storyboard = UIStoryboard(name: Constants.storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.viewControllerIdentifier) as! CountryDetailsViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    // Should be a table view.
    // TODO: Add animation, have the info panel have their own UIView class then have them in a array. Animate one by one using alpha 0 to 1, move constraint from the side (slide like animation)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = ColorConstants.Main.Light
        flagImageView.kf.setImage(with: viewModel.flagURL)
        flagBackgroundImageView.kf.setImage(with: viewModel.flagURL)
        officialNameLabel.text = viewModel.officialName
        commonNameLabel.text = viewModel.commonName
        populationLabel.text = viewModel.population
        populationFlairLabel.text = viewModel.populationFlair
        capitalLabel.text = viewModel.capital
        capitalInfoLabel.text = viewModel.capitalInfo
        languageLabel.text = viewModel.languageCount
        languageInfoLabel.text = viewModel.languages
        regionLabel.text = viewModel.region
        unFlagImageView.isHidden = !viewModel.unitedNationsMembership
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}


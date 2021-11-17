//
//  CountryListViewController.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/16/21.
//

import UIKit
import RxSwift
import RxCocoa

class CountryListViewController: UIViewController {
    private var viewModel: CountryListViewModel!
    let disposeBag = DisposeBag()
    var coordinator: AppCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    enum Constants {
        static let storyboard = "Country"
        static let viewControllerIdentifier = "Country List"
    }
    
    static func instantiate(with viewModel: CountryListViewModel) -> CountryListViewController {
        let storyboard = UIStoryboard(name: Constants.storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.viewControllerIdentifier) as! CountryListViewController
        
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateList()
        setupObservables()
    }
    
    func setupUI() {
        // Navigation
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.tintColor = ColorConstants.Main.Dark
        // TableView
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.sectionHeaderHeight = 0
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 180, right: 0)
    }
    
    func setupObservables() {
        viewModel.query.asObservable().subscribe { text in
            self.viewModel.fetchCountryViewModels(query: text).subscribe { viewModel in
                self.viewModel.countries.onNext(viewModel)
            }.disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
        
        updateSearchQuery()
        
        viewModel.countries.bind(to: tableView.rx.items(cellIdentifier: CountryItemTableViewCell.Constants.identifier,
                                                        cellType: CountryItemTableViewCell.self)) { index, viewModel, cell in
            cell.setup(with: viewModel)
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { index in
            guard let cell = self.tableView.cellForRow(at: index) as? CountryItemTableViewCell,
                  let viewModel = cell.viewModel
            else {
                return
            }
            let details = CountryDetailsViewModel(from: viewModel)
            self.coordinator?.countryDetails(viewModel: details)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        updateSearchQuery()
    }
    
    func updateSearchQuery() {
        viewModel.query.onNext(searchTextField.text ?? "")
    }
    
    func updateList() {
        self.viewModel.fetchCountryViewModels()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
}


//
//  CountryListViewModel.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RxSwift

final class CountryListViewModel {
    let disposeBag = DisposeBag()
    
    enum ErrorMessages {
        static let fetchFailure = "Failed to get the list of Countries."
    }
    
    var title = "Countrinfo"
    
    var countries: BehaviorSubject<[CountryItemViewModel]> = BehaviorSubject(value: [])
    var error: BehaviorSubject<String> = BehaviorSubject(value: "")
    var query = PublishSubject<String>()
    var lastUserId = 0
    
    var isSearching = false
    
    private let repository: CountryRepositoryProtocol
    
    init(repository: CountryRepositoryProtocol = CountryRepository()) {
        self.repository = repository
        
        query.asObservable().subscribe { text in
            self.isSearching = !text.isEmpty
        }.disposed(by: disposeBag)
    }
    
    func fetchCountryViewModels() {
        // Would be nice if API is capable of item range so the list can lazy load
        repository.fetchAll { countries in
            let countries = countries.map { CountryItemViewModel(from: $0) }
            self.countries.onNext(countries)
        } failure: { error in
            self.error.onNext(ErrorMessages.fetchFailure)
        }

    }
    
    func fetchCountryViewModels(query: String? = "") -> Observable<[CountryItemViewModel]> {
        let objects = repository.fetchAllCached(query: query).map { CountryItemViewModel(from: $0) }
        return Observable.just(objects)
    }
    
}

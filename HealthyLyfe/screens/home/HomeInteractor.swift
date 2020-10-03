//
//  HomeInteractor.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

final class HomeInteractor {

    private let dataService: AdviceBookFetching

    weak var output: HomeInteractorOutput?

    init(dataService: AdviceBookFetching) {
        self.dataService = dataService
    }
}

extension HomeInteractor: HomeInteractorInput {

    func fetchAdviceBooks() {
        dataService.fetchAdviceBooks { [weak self] result in
            switch result {
            case .error(let errorMessage):
                self?.output?.didFailToFetchAdviceBooks(message: errorMessage)
            case .success(let response):
                self?.output?.didFetchAdviceBooks(response.books, title: response.listTitle)
            }
        }
    }
}

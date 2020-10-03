//
//  BrowseArticleInteractor.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

final class BrowseArticleInteractor {

    private let dataService: ArticleFetching

    weak var output: BrowseArticleInteractorOutput?

    init(dataService: ArticleFetching) {
        self.dataService = dataService
    }
}

extension BrowseArticleInteractor: BrowseArticleInteractorInput {

    func fetchArticles(for subject: ArticleSubject) {
        dataService.fetchArticles(for: subject.rawValue) { [weak self] result in
            switch result {
            case .error(let errorMessage):
                self?.output?.didFailToFetchArticles(message: errorMessage)
            case .success(let response):
                self?.output?.didFetchArticles(response.articles)
            }
        }
    }
}

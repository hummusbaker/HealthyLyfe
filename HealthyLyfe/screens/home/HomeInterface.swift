//
//  HomeInterface.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

protocol HomeUserInterface: class, PopAlertViewPresenting {
    func configure(with viewModel: HomeViewModel)
}

protocol HomePresenterInterface: class {
    func didLoad()
    func didTapOnArticleSubject(_ articleSubject: ArticleSubject)
    func didTapOnUrl(_ url: URL)
}

protocol HomeInteractorInput {
    func fetchAdviceBooks()
}

protocol HomeInteractorOutput: class {
    func didFetchAdviceBooks(_ books: [Book], title: String)
    func didFailToFetchAdviceBooks(message: String)
}

protocol HomeWireframeInterface {
    func openUrl(_ url: URL)
    func showBrowseArticle(for articleSubject: ArticleSubject)
}

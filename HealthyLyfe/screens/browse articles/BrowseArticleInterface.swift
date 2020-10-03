//
//  BrowseArticleInterface.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

protocol BrowseArticleUserInterface: class, PopAlertViewPresenting {
    func configure(with viewModel: BrowseArticleViewModel)
}

protocol BrowseArticlePresenterInterface: class {
    func didLoad()
    func didTapOnArticle(_ article: Article)
}

protocol BrowseArticleInteractorInput {
    func fetchArticles(for subject: ArticleSubject)
}

protocol BrowseArticleInteractorOutput: class {
    func didFetchArticles(_ articles: [Article])
    func didFailToFetchArticles(message: String)
}

protocol BrowseArticleWireframeInterface: class {
    func showWebview(for url: URL)
    func dismiss()
}

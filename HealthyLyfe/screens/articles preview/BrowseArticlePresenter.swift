//
//  BrowseArticlePresenter.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

final class BrowseArticlePresenter {

    weak var userInterface: BrowseArticleUserInterface!
    var interactor: BrowseArticleInteractorInput!
    var wireframe: BrowseArticleWireframeInterface!

    private let articleSubject: ArticleSubject

    init(articleSubject: ArticleSubject) {
        self.articleSubject = articleSubject
    }
}

extension BrowseArticlePresenter: BrowseArticlePresenterInterface {

    func didLoad() {
        // set up navigation bar look
        let viewModel = BrowseArticleViewModel(articleSubject: articleSubject, articles: [])
        userInterface.configure(with: viewModel)

        interactor.fetchArticles(for: articleSubject)
    }

    func didTapOnArticle(_ article: Article) {
        wireframe.showWebview(for: article.url)
    }
}

extension BrowseArticlePresenter: BrowseArticleInteractorOutput {

    func didFetchArticles(_ articles: [Article]) {
        let viewModel = BrowseArticleViewModel(articleSubject: articleSubject, articles: articles)
        userInterface.configure(with: viewModel)
    }

    func didFailToFetchArticles(message: String) {
        // TODO
    }
}

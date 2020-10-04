//
//  BrowseArticleMocks.swift
//  HealthyLyfeTests
//
//  Created by Dawid Skiba on 10/3/20.
//

import Foundation
@testable import HealthyLyfe

final class MockBrowseArticleUserInterface: BrowseArticleUserInterface {
    var configureCallCount = 0
    var configureSpy: BrowseArticleViewModel?

    var errorPopViewAlertCallCount = 0
    var errorPopViewAlertSpy: (message: String, dismissAction: () -> Void)?

    func configure(with viewModel: BrowseArticleViewModel) {
        configureCallCount += 1
        configureSpy = viewModel
    }

    func errorPopViewAlert(with message: String, dismissAction: @escaping () -> Void) {
        errorPopViewAlertCallCount += 1
        errorPopViewAlertSpy = (message, dismissAction)
    }
}

//final class MockBrowseArticlePresenterInterface: BrowseArticlePresenterInterface {
//    var didLoadCallCount = 0
//    var didTapOnArticleCallCount = 0
//    var didTapOnArticleSpy: Article?
//
//    func didLoad() {
//        didLoadCallCount += 1
//    }
//
//    func didTapOnArticle(_ article: Article) {
//        didTapOnArticleCallCount += 1
//        didTapOnArticleSpy = article
//    }
//}

final class MockBrowseArticleInteractorInput: BrowseArticleInteractorInput {
    var fetchArticlesCallCount = 0
    var fetchArticlesSpy: ArticleSubject?

    func fetchArticles(for subject: ArticleSubject) {
        fetchArticlesCallCount += 1
        fetchArticlesSpy = subject
    }
}

final class MockBrowseArticleWireframeInterface: BrowseArticleWireframeInterface {
    var showWebviewCallCount = 0
    var showWebviewSpy: URL?
    var dismissCallCount = 0

    func showWebview(for url: URL) {
        showWebviewCallCount += 1
        showWebviewSpy = url
    }

    func dismiss() {
        dismissCallCount += 1
    }
}

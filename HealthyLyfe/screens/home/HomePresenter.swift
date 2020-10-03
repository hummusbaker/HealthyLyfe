//
//  HomePresenter.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

final class HomePresenter {

    weak var userInterface: HomeUserInterface!
    var interactor: HomeInteractorInput!
    var wireframe: HomeWireframeInterface!

    init() { }
}

extension HomePresenter: HomePresenterInterface {

    func didLoad() {
        // set up navigation bar look
        let viewModel = HomeViewModel.default
        userInterface.configure(with: viewModel)

        interactor.fetchAdviceBooks()
    }

    func didTapOnArticleSubject(_ articleSubject: ArticleSubject) {
        wireframe.showBrowseArticle(for: articleSubject)
    }

    func didTapOnUrl(_ url: URL) {
        wireframe.openUrl(url)
    }
}

extension HomePresenter: HomeInteractorOutput {

    func didFetchAdviceBooks(_ books: [Book], title: String) {
        let viewModel = HomeViewModel(books: books)
        userInterface.configure(with: viewModel)
    }

    func didFailToFetchAdviceBooks(message: String) {
        userInterface.errorPopViewAlert(with: message) { }
    }
}

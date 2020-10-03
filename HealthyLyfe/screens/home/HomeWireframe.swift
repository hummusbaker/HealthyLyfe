//
//  HomeWireframe.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

final class HomeWireframe {

    private weak var viewController: UIViewController?
    private let dataService: DataServiceInterface

    init(dataService: DataServiceInterface) {
        self.dataService = dataService
    }

    func createViewController() -> UIViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(dataService: dataService)
        let userInterface = HomeViewController()

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.wireframe = self

        self.viewController = userInterface
        return userInterface
    }
}

extension HomeWireframe: HomeWireframeInterface {

    func openUrl(_ url: URL) {
        UIApplication.shared.open(url)
    }

    func showBrowseArticle(for articleSubject: ArticleSubject) {
        guard let navigationController = viewController?.navigationController else {
            return
        }

        BrowseArticleWireframe(dataService: dataService, articleSubject: articleSubject).push(on: navigationController)
    }
}

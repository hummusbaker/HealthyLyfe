//
//  BrowseArticleWireframe.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

final class BrowseArticleWireframe {

    private weak var viewController: UIViewController?
    private var dismissClosure: (() -> Void)?
    private let dataService: DataServiceInterface
    private let articleSubject: ArticleSubject

    init(dataService: DataServiceInterface, articleSubject: ArticleSubject) {
        self.dataService = dataService
        self.articleSubject = articleSubject
    }

    func push(on navigationController: UINavigationController) {
        let vc = createViewController()
        self.viewController = vc

        navigationController.pushViewController(vc, animated: true)
        dismissClosure = { [weak navigationController] in
            navigationController?.popViewController(animated: true)
        }
    }

    private func createViewController() -> UIViewController {
        let presenter = BrowseArticlePresenter(articleSubject: articleSubject)
        let interactor = BrowseArticleInteractor(dataService: dataService)
        let userInterface = BrowseArticleViewController()

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.wireframe = self

        return userInterface
    }
}

extension BrowseArticleWireframe: BrowseArticleWireframeInterface {

    func showWebview(for url: URL) {
        let webViewController = WebViewController(url: url)
        let navigationController = UINavigationController(rootViewController: webViewController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = articleSubject.color
        navigationController.navigationBar.tintColor = .white
        viewController?.present(navigationController, animated: true, completion: nil)
    }

    func dismiss() {
        dismissClosure?()
    }
}

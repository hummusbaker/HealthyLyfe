//
//  HomeViewController.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

class HomeViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        configureNavigtionBarTint(with: .appRed)
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            self?.showBrowseArticle(for: .vegan)
//        }
//    }
}

private extension HomeViewController {

    func setUp() {
        navigationItem.backButtonTitle = ""

        view.backgroundColor = .appBackground
        title = "Healthy Lyfe"

        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func showBrowseArticle(for subject: ArticleSubject) {
        guard let navigationController = navigationController else {
            return
        }

        BrowseArticleWireframe(dataService: DataService(), articleSubject: subject).push(on: navigationController)
    }
}

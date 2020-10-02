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

        DataService().fetchArticles(for: "vegan") { result in
            switch result {
            case .success(let response):
                print(response)
            case .error(let errorMessage):
                print(errorMessage)
            }
        }
    }
}

private extension HomeViewController {

    func setUp() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appRed]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appRed]

        view.backgroundColor = .appBackground
        title = "Healthy Lyfe"

        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

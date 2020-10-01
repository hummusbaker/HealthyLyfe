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
}

private extension HomeViewController {

    func setUp() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTeal]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTeal]

        view.backgroundColor = .pageBackground
        title = "Home"

        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

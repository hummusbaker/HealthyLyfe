//
//  HomeViewController.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenterInterface!
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var viewModel: HomeViewModel = .default
    private let tintColor: UIColor = .appRed

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        presenter.didLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        configureNavigtionBarTint(with: tintColor)
    }
}

extension HomeViewController: HomeUserInterface {

    func configure(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        switch section.type {
        case .articles:
            if let cellViewModel = viewModel.articleSubjectViewModel(at: indexPath.row),
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleSubjectTableViewCell.reuseIdentifier, for: indexPath) as? ArticleSubjectTableViewCell {
                cell.configure(with: cellViewModel)
                cell.selectionStyle = .none
                return cell
            }
        case .books:
            if let cellViewModel = viewModel.bookStackViewModel,
               let cell = tableView.dequeueReusableCell(withIdentifier: BookStackTableViewCell.reuseIdentifier, for: indexPath) as? BookStackTableViewCell {
                cell.configure(with: cellViewModel)
                cell.selectionStyle = .none
                return cell
            }
        }

        // backup
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = viewModel.sections[indexPath.section]
        switch section.type {
        case .articles:
            if let articleSubject = viewModel.articleSubject(at: indexPath.row) {
                presenter.didTapOnArticleSubject(articleSubject)
            }
        case .books:
            return
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = viewModel.sections[section].sectionTitle
        return HeaderView(text: sectionTitle)
    }
}

private extension HomeViewController {

    func setUp() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .appBackground
        title = "Healthy Lyfe"

        tableView.backgroundColor = .white
        tableView.register(ArticleSubjectTableViewCell.classForCoder(), forCellReuseIdentifier: ArticleSubjectTableViewCell.reuseIdentifier)
        tableView.register(BookStackTableViewCell.classForCoder(), forCellReuseIdentifier: BookStackTableViewCell.reuseIdentifier)

        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.delegate = self
        tableView.dataSource = self
    }
}

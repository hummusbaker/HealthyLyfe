//
//  BrowseArticleViewController.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

class BrowseArticleViewController: UIViewController {

    var presenter: BrowseArticlePresenterInterface!
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var viewModel: BrowseArticleViewModel = .default

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        presenter.didLoad()
    }
}

extension BrowseArticleViewController: BrowseArticleUserInterface {

    func configure(with viewModel: BrowseArticleViewModel) {
        self.viewModel = viewModel
        title = viewModel.navigationTitle
        configureNavigtionBarTint(with: viewModel.tintColor)
        collectionView.reloadData()
    }
}

extension BrowseArticleViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticlePreviewCollectionViewCell.reuseIdentifier, for: indexPath)

        if let articlePreviewCell = cell as? ArticlePreviewCollectionViewCell,
            let viewModel = viewModel.articlePreviewViewModel(at: indexPath.item) {
            articlePreviewCell.configure(with: viewModel)
        }
        return cell
    }
}

extension BrowseArticleViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 32
        let cellHeight = cellWidth * 4/5.0
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
}

extension BrowseArticleViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let article = viewModel.article(at: indexPath.item) else {
            return
        }
        
        presenter.didTapOnArticle(article)
    }
}

private extension BrowseArticleViewController {

    func setUp() {
        edgesForExtendedLayout = []
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .appBackground

        view.addSubview(collectionView)
        collectionView.backgroundColor = .appBackground
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticlePreviewCollectionViewCell.self, forCellWithReuseIdentifier: ArticlePreviewCollectionViewCell.reuseIdentifier)
    }
}

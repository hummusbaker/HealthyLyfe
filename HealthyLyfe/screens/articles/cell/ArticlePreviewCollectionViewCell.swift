//
//  ArticlePreviewCollectionViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit
import Kingfisher
import SnapKit

class ArticlePreviewCollectionViewCell: UICollectionViewCell {

    typealias ViewModel = ArticlePreviewViewModel

    private let imageView = UIImageView()
    private let detailContentView = UIView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }

    deinit {
        imageView.kf.cancelDownloadTask()
    }
}

extension ArticlePreviewCollectionViewCell : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.dateString
        detailContentView.backgroundColor = viewModel.tintColor
        imageView.image = nil
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: viewModel.imageUrl)
    }
}

private extension ArticlePreviewCollectionViewCell {

    func setUp() {
        clipsToBounds = true
        layer.cornerRadius = .cornerRadius

        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.addSubview(detailContentView)
        detailContentView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
        }

        detailContentView.addSubview(dateLabel)
        dateLabel.numberOfLines = 1
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(16)
            make.left.greaterThanOrEqualToSuperview().offset(16)
        }

        detailContentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
        }
    }
}

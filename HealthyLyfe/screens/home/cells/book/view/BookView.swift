//
//  BookCollectionViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit
import Kingfisher
import SnapKit

class BookView: UIView {

    typealias ViewModel = BookViewModel

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    deinit {
        imageView.kf.cancelDownloadTask()
    }
}

extension BookView : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        imageView.image = nil
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: viewModel.imageUrl)
    }
}

private extension BookView {

    func setUp() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = .cornerRadius

        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

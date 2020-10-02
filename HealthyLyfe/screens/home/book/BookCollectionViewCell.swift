//
//  BookCollectionViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit
import Kingfisher
import SnapKit

class BookCollectionViewCell: UICollectionViewCell {

    typealias ViewModel = BookViewModel

    private let imageView = UIImageView()
    private let amazonButton = UIButton(type: .infoLight)
    private var amazonButtonClosure: (() -> Void)?

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
        amazonButtonClosure = nil
    }

    deinit {
        imageView.kf.cancelDownloadTask()
    }
}

extension BookCollectionViewCell : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        imageView.image = nil
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: viewModel.imageUrl)
        if let buttonClosure = viewModel.amazonButtonClosure {
            amazonButtonClosure = buttonClosure
            amazonButton.isHidden = false
        } else {
            amazonButton.isHidden = true
        }
    }
}

private extension BookCollectionViewCell {

    func setUp() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = .cornerRadius

        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.addSubview(amazonButton)
        amazonButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(4)
            make.top.equalToSuperview().offset(4)
            make.width.height.equalTo(30)
        }
        amazonButton.layer.cornerRadius = 15
        amazonButton.addTarget(self, action: #selector(amazonButtonPressed), for: .touchUpInside)
    }

    @objc func amazonButtonPressed() {
        amazonButtonClosure?()
    }
}

//
//  ArticleSubjectTableViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit
import SnapKit

class ArticleSubjectTableViewCell: UITableViewCell {

    typealias ViewModel = ArticleSubjectViewModel

    static var reuseIdentifier = String(describing: ArticleSubjectTableViewCell.self)

    private let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

extension ArticleSubjectTableViewCell : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.tintColor
    }
}

private extension ArticleSubjectTableViewCell {

    func setUp() {
        backgroundColor = .clear

        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        contentView.addSubview(titleLabel)
        let edgeInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(edgeInset)
        }
    }
}


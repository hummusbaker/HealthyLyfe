//
//  TagTableViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit
import SnapKit

class TagTableViewCell: UITableViewCell {

    typealias ViewModel = TagViewModel

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

extension TagTableViewCell : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.tintColor
    }
}

private extension TagTableViewCell {

    func setUp() {
        backgroundColor = .clear

        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        contentView.addSubview(titleLabel)
        let edgeInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(edgeInset)
        }
    }
}


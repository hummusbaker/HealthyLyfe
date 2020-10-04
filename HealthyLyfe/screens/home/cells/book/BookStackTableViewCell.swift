//
//  BookStackTableViewCell.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation
import SnapKit

class BookStackTableViewCell: UITableViewCell {

    typealias ViewModel = BookStackViewModel

    static var reuseIdentifier = String(describing: BookStackTableViewCell.self)

    private let scrollView = UIScrollView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

extension BookStackTableViewCell : ViewModelConfigurable {

    func configure(with viewModel: ViewModel) {
        stackView.removeAllArrangedSubviews()
        viewModel.bookViewModels.forEach {
            addBookView(for: $0)
        }

        stackView.layoutIfNeeded()
    }
}

private extension BookStackTableViewCell {

    func setUp() {
        backgroundColor = .clear

        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16.0
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true

        scrollView.addSubview(stackView)
        scrollView.showsHorizontalScrollIndicator = false
        stackView.snp.makeConstraints { make in
            make.right.left.height.centerY.equalToSuperview()
            make.height.equalTo(200)
        }
    }

    func addBookView(for viewModel: BookViewModel) {
        let bookView = BookView(frame: .zero)
        bookView.snp.makeConstraints { make in
            make.width.equalTo(bookView.snp.height).multipliedBy(5/8.0)
        }
        bookView.configure(with: viewModel)
        bookView.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.addArrangedSubview(bookView)
    }
}

private extension UIStackView {

    func removeAllArrangedSubviews() {
        while let view = arrangedSubviews.first {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}

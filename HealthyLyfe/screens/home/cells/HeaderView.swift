//
//  HeaderView.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

class HeaderView: UIView {

    private let label: UILabel

    init(text: String) {
        let theLabel = UILabel(frame: .zero)
        theLabel.text = text
        theLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        theLabel.numberOfLines = 2
        label = theLabel
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        backgroundColor = .clear
        addSubview(label)
        let edgeInset = UIEdgeInsets(top: 16, left: 16, bottom: 4, right: 16)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(edgeInset)
        }
    }
}

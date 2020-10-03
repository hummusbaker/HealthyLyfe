//
//  ArticleSubjectViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

struct ArticleSubjectViewModel {

    let title: String
    let tintColor: UIColor

    init(title: String, tintColor: UIColor) {
        self.title = "• \(title)"
        self.tintColor = tintColor
    }

    init(articleSubject: ArticleSubject) {
        self.init(title: articleSubject.rawValue.capitalized, tintColor: articleSubject.color)
    }
}

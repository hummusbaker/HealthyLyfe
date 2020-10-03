//
//  ArticlePreviewViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

struct ArticlePreviewViewModel {

    let title: String
    let tintColor: UIColor
    let dateString: String?
    let imageUrl: URL?

    init(title: String, tintColor: UIColor, dateString: String?, imageUrl: URL?) {
        self.title = title
        self.tintColor = tintColor
        self.dateString = dateString
        self.imageUrl = imageUrl
    }

    init(article: Article, tintColor: UIColor) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.init(title: article.title,
                  tintColor: tintColor,
                  dateString: article.date.map { dateFormatter.string(from: $0) },
                  imageUrl: article.imageUrl)
    }
}

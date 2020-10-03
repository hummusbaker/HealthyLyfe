//
//  BrowseArticleViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

struct BrowseArticleViewModel {

    private let articleSubject: ArticleSubject?
    private let articles: [Article]

    init(articleSubject: ArticleSubject?, articles: [Article]) {
        self.articleSubject = articleSubject
        self.articles = articles
    }

    static var `default`: BrowseArticleViewModel{
        BrowseArticleViewModel(articleSubject: nil, articles: [])
    }
}

extension BrowseArticleViewModel {

    var navigationTitle: String {
        articleSubject?.rawValue.capitalized ?? "Loading"
    }

    var tintColor: UIColor {
        articleSubject?.color ?? .black
    }

    var count: Int {
        articles.count
    }

    func article(at index: Int) -> Article? {
        if index < 0 || index >= articles.count {
            return nil
        }

        return articles[index]
    }

    func articlePreviewViewModel(at index: Int) -> ArticlePreviewViewModel? {
        guard let theArticle = article(at: index) else {
            return nil
        }

        return ArticlePreviewViewModel(article: theArticle, tintColor: tintColor)
    }
}

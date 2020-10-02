//
//  ArticleFetching.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/1/20.
//

import Foundation

typealias ArticleResult = NetworkResponse<ArticleResponse, String>

protocol ArticleFetching {
    func fetchArticles(for searchTerm: String, complete: @escaping (ArticleResult) -> Void)
}

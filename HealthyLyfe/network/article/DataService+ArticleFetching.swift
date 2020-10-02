//
//  DataService+ArticleFetching.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

extension DataService: ArticleFetching {

    func fetchArticles(for searchTerm: String, complete: @escaping (ArticleResult) -> Void) {
        let path = "https://api.nytimes.com/svc/search/v2/articlesearch.json"
        let request = ArticleSearchRequest(query: searchTerm)
        get(for: path, request: request, complete: complete)
    }
}

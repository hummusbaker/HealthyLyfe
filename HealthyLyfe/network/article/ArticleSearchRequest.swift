//
//  ArticleSearchRequest.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct ArticleSearchRequest: Encodable {

    enum CodingKeys: String, CodingKey {
        case apiKey = "api-key"
        case query
    }

    let query: String
    let apiKey: String = k_nytApiKey

    init(query: String) {
        self.query = query
    }
}

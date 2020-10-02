//
//  ArticleSearchRequest.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

private let k_nytApiKey = "4A3gglpILt8Ish7p8o4tnCEO1VZgiMZE"

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

//
//  ArticleSearchResponse.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/1/20.
//

import Foundation

struct ArticleSearchResponse: Decodable  {

    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case response
        case articles = "docs"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        articles = try response.decode([Article].self, forKey: .articles)
    }
}

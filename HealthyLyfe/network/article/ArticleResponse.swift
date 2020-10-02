//
//  ArticleResponse.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/1/20.
//

import Foundation

class ArticleResponse: Decodable  {

    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case response
        case articles = "docs"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        articles = try response.decode([Article].self, forKey: .articles)
    }
}

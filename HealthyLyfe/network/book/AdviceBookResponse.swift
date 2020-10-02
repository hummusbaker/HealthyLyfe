//
//  AdviceBookResponse.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct AdviceBookResponse: Decodable  {

    let listTitle: String
    let books: [Book]

    enum CodingKeys: String, CodingKey {
        case results
        case listTitle = "list_name"
        case books
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let results = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .results)

        listTitle = try results.decode(String.self, forKey: .listTitle)
        books = try results.decode([Book].self, forKey: .books)
    }
}

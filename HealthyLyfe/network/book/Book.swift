//
//  Book.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct Book: Decodable {

    let imageUrl: URL
    let amazonUrl: URL?

    enum CodingKeys: String, CodingKey {
        case imageUrl = "book_image"
        case amazonUrl = "amazon_product_url"
    }
}

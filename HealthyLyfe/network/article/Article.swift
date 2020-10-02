//
//  Article.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct Article: Decodable {

    let url: URL
    let dateRaw: String
    let imageUrl: URL?
    let title: String

    enum CodingKeys: String, CodingKey {
        case url = "web_url"
        case date = "pub_date"
        case media = "multimedia"
        case headline
        case title = "main"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        url = try container.decode(URL.self, forKey: .url)
        dateRaw = try container.decode(String.self, forKey: .date)

        let mediaArray = try container.decode([Media].self, forKey: .media)
        let desiredMedia = mediaArray.first(where: { $0.subtype == "blog480" })
        imageUrl = desiredMedia?.url

        let headline = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .headline)
        title = try headline.decode(String.self, forKey: .title)
    }
}

extension Article {

    var date: Date? {
        ISO8601DateFormatter().date(from: dateRaw)
    }
}

private struct Media: Decodable {

    let subtype: String
    let url: URL
}

//
//  ArticlePreviewViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

struct ArticlePreviewViewModel {

    let title: String
    let tintColor: UIColor
    let dateString: String?
    let imageUrl: URL?

    init(title: String, tintColor: UIColor, dateString: String?, imageUrl: URL?) {
        self.title = title
        self.tintColor = tintColor
        self.dateString = dateString
        self.imageUrl = imageUrl
    }
}

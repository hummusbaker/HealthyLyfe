//
//  BookViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct BookViewModel {

    let imageUrl: URL
    let amazonButtonClosure: (() -> Void)?

    init(imageUrl: URL, amazonButtonClosure: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.amazonButtonClosure = amazonButtonClosure
    }
}

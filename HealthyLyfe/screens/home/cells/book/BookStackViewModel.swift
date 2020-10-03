//
//  BookStackViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

struct BookStackViewModel {

    let bookViewModels: [BookViewModel]

    init(books: [Book]) {
        bookViewModels = books.map { BookViewModel(imageUrl: $0.imageUrl) }
    }
}

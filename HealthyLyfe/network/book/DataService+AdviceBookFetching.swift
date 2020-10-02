//
//  DataService+AdviceBookFetching.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

extension DataService: AdviceBookFetching {

    func fetchAdviceBooks(complete: @escaping (AdviceBookResult) -> Void) {
        let path = "https://api.nytimes.com/svc/books/v3/lists/current/advice-how-to-and-miscellaneous.json?api-key=\(k_nytApiKey)"
        get(for: path, request: nil, complete: complete)
    }
}

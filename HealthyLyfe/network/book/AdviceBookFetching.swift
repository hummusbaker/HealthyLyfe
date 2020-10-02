//
//  AdviceBookFetching.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

typealias AdviceBookResult = NetworkResponse<AdviceBookResponse, String>

protocol AdviceBookFetching {
    func fetchAdviceBooks(complete: @escaping (AdviceBookResult) -> Void)
}

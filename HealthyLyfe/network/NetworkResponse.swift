//
//  NetworkResponse.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation

enum NetworkResponse<R, E> {
    case success(R)
    case error(E)
}

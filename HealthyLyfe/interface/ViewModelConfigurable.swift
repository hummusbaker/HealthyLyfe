//
//  ViewModelConfigurable.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import Foundation

public protocol ViewModelConfigurable {
    associatedtype ViewModel

    func configure(with viewModel: ViewModel)
}

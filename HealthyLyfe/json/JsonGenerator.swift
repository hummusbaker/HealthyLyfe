//
//  JsonGenerator.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/3/20.
//

import Foundation

public class JsonGenerator {

    public func jsonData(named jsonName: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: jsonName, withExtension: ".json")!
        do {
            let jsonData = try Data(contentsOf: url)
            return jsonData
        } catch { fatalError("There is no json named: \(jsonName)") }
    }
}

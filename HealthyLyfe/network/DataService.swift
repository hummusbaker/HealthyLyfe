//
//  DataService.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import Foundation
import Alamofire

let k_nytApiKey = "4A3gglpILt8Ish7p8o4tnCEO1VZgiMZE"

final class DataService {

    func get<Response: Decodable>(for path: String, request: Encodable?, complete: @escaping (NetworkResponse<Response, String>) -> Void) {
        guard let url = URL(string: path) else {
            return complete(.error(internalErrorMessage("invalid url request")))
        }

        AF.request(url, method: .get, parameters: request?.dictionary).response { response in
            if let error = response.error {
                return complete(.error(error.localizedDescription))
            }

            guard let data = response.data else {
                return complete(.error(internalErrorMessage("no data")))
            }

            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                complete(.success(response))
            } catch {
                complete(.error(internalErrorMessage("invalid response type")))
            }
        }
    }
}

private extension Encodable {

    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

private func internalErrorMessage(_ message: String) -> String {
    return "Ooops. something wrong happened [\(message)]"
}

//
//  WebService.swift
//  AsyncAwaitSwiftUI
//
//  Created by AnushaValasapalli on 6/24/25.
//

import Foundation

final class WebService {
    static func getUserData() async throws -> [UserModel] {
        let urlString = "https://api.github.com/users"
        
        guard let url = URL(string: urlString) else {
            throw errorCases.InvalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw errorCases.InvalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserModel].self, from: data)
        } catch {
            throw errorCases.InvalidData
        }
    }
}


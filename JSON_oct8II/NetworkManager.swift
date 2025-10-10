//
//  NetworkManager.swift
//  JSON_oct8II
//
//  Created by Koushik Reddy Kambham on 10/9/25.
//

import UIKit

protocol NetworkManagerProtocol {
    func fetchUsers() async throws -> [User]
}

enum NetworkError : Error {
    case invalidURL
    case requestFailed
    
    var errorDesc: String? {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .requestFailed:
            return "netwo swrk request failed"
        }
    }
}

final class NetworkManager : NetworkManagerProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: Server.endPoint.rawValue) else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let users = try JSONDecoder().decode([User].self,from: data)
            return users
        }
        catch {
            throw NetworkError.requestFailed
        }
    }
}

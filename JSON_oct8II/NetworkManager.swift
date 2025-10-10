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

final class NetworkManager : NetworkManagerProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: Server.endPoint.rawValue) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let users = try JSONDecoder().decode([User].self,from: data)
            return users
        }
        catch {
            throw error
        }
    }
}

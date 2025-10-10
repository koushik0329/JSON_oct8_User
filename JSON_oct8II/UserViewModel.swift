//
//  UserViewModel.swift
//  JSON_oct8II
//
//  Created by Koushik Reddy Kambham on 10/10/25.
//

class UserViewModel {
    var users : [User] = []
    
    private let networkManagerObj : NetworkManagerProtocol
    
    init(networkManagerObj : NetworkManagerProtocol) {
        self.networkManagerObj = networkManagerObj
    }
    
    @MainActor
    func getData() async{
        do {
            users = try await networkManagerObj.fetchUsers()
        }
        catch {
            print("error fetch data", error)
        }
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
    
    func getUsers(at index: Int) -> User {
        return users[index]
    }
}

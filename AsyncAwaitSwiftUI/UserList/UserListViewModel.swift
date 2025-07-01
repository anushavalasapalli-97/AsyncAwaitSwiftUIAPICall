//
//  UserListViewModel.swift
//  AsyncAwaitSwiftUI
//
//  Created by AnushaValasapalli on 6/24/25.
//

import Foundation
@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [UserModel]?
    @Published var isLoading = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?
    func getUsers() async {
        self.isLoading = true
        do {
            let users = try await WebService.getUserData()
            self.users = users
            self.isLoading = false
        } catch (let error) {
            print(error.localizedDescription)
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}

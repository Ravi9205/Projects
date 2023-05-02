//
//  UserManager.swift
//  OffLineStore
//
//  Created by Ravi Dwivedi on 01/05/23.
//

import Foundation



struct UserManager
{
    private let _userDataRepository = UserDataRepository()

    func createEmployee(user: User) {
        _userDataRepository.createUser(user: user)
    }

    func fetchEmployee() -> [User]? {
        return _userDataRepository.getAll()
    }

    
    func fetchUsers(byIdentifier id: UUID) -> User?
    {
        return _userDataRepository.get(byIdentifier: id)
    }

    func updateUser(user: User) -> Bool {
        return _userDataRepository.update(user:user )
    }

    func deleteEmployee(id: UUID) -> Bool {
        return _userDataRepository.delete(id: id)
    }
     
}
    
    

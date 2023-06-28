//
//  CDUserRepository.swift
//  OffLineStore
//
//  Created by Ravi Dwivedi on 01/05/23.
//

import Foundation
import CoreData


protocol UserRepository{
    func createUser(user:User)
    func getAll() -> [User]?
    func update(user: User) -> Bool
    func get(byIdentifier id: UUID) -> User?
    func delete(id: UUID) -> Bool
}

struct UserDataRepository:UserRepository{
    
    func createUser(user: User) {
        let cdUser =  UserEntity(context: DBManager.shared.context)
        cdUser.email = user.email
        cdUser.firstName = user.firstName
        cdUser.lastName = user.lastName
        cdUser.password = user.password
        cdUser.userImage = user.imageName
        DBManager.shared.saveContext()
    }
    
    func getAll() -> [User]? {
        let result =   DBManager.shared.fetchManagedObject(managedObject: UserEntity.self)
        var user:[User] = []
        result?.forEach({ cdUser in
            user.append(cdUser.convertToUser())
        })
        return user
    }
    
    func get(byIdentifier id: UUID) -> User? {
        let result = getCDUser(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToUser()
    }

    func update(user: User) -> Bool {

        let cdUser = getCDUser(byIdentifier: user.id)
        guard cdUser != nil else {return false}

        cdUser?.email = user.email
        cdUser?.firstName = user.firstName
        cdUser?.lastName = user.lastName
        cdUser?.password = user.password
        cdUser?.userImage = user.imageName

        DBManager.shared.saveContext()
        return true
    }

    func delete(id: UUID) -> Bool {

        let cdUser = getCDUser(byIdentifier: id)
        guard cdUser != nil else {return false}

        DBManager.shared.context.delete(cdUser!)
        DBManager.shared.saveContext()
        return true
    }
    
    
    private func getCDUser(byIdentifier id: UUID) -> UserEntity?
    {
        let fetchRequest = NSFetchRequest<UserEntity>(entityName: "CDUser")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)

        fetchRequest.predicate = predicate
        do {
            let result = try DBManager.shared.context.fetch(fetchRequest).first

            guard result != nil else {return nil}

            return result

        }
        catch let error {
            debugPrint(error)
        }

        return nil
    }
}

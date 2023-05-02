//
//  UserEntity+CoreDataProperties.swift
//  OffLineStore
//
//  Created by Ravi Dwivedi on 01/05/23.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "CDUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var userImage: String?
    @NSManaged public var id: UUID?

}

extension UserEntity : Identifiable {
    func convertToUser() -> User
    {
        return User(id:id ?? UUID(),email: email!, firstName: firstName!, lastName: lastName!, password: password!, imageName: userImage!)
    }
}

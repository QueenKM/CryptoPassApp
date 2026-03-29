//
//  UserActivityLog+CoreDataProperties.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//
//

import Foundation
import CoreData

extension UserActivityLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserActivityLog> {
        return NSFetchRequest<UserActivityLog>(entityName: "UserActivityLog")
    }

    @NSManaged public var actionType: String?
    @NSManaged public var details: String?
    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var user: NSSet?
}

extension UserActivityLog {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: UserProfile)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: UserProfile)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)
}

extension UserActivityLog : Identifiable {

}

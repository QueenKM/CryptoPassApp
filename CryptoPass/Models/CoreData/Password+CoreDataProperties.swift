//
//  Password+CoreDataProperties.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//
//

import Foundation
import CoreData

extension Password {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Password> {
        return NSFetchRequest<Password>(entityName: "Password")
    }

    @NSManaged public var category: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var encryptedPassword: String?
    @NSManaged public var id: UUID?
    @NSManaged public var notes: String?
    @NSManaged public var serviceName: String?
    @NSManaged public var username: String?
    @NSManaged public var changeHistory: NSSet?
}

extension Password {

    @objc(addChangeHistoryObject:)
    @NSManaged public func addToChangeHistory(_ value: PasswordChangeHistory)

    @objc(removeChangeHistoryObject:)
    @NSManaged public func removeFromChangeHistory(_ value: PasswordChangeHistory)

    @objc(addChangeHistory:)
    @NSManaged public func addToChangeHistory(_ values: NSSet)

    @objc(removeChangeHistory:)
    @NSManaged public func removeFromChangeHistory(_ values: NSSet)
}

extension Password : Identifiable {

}

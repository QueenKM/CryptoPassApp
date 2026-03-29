//
//  PasswordChangeHistory+CoreDataProperties.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//
//

import Foundation
import CoreData

extension PasswordChangeHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PasswordChangeHistory> {
        return NSFetchRequest<PasswordChangeHistory>(entityName: "PasswordChangeHistory")
    }

    @NSManaged public var changeDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var newPassword: String?
    @NSManaged public var oldPassword: String?
    @NSManaged public var passwordID: UUID?
    @NSManaged public var password: NSSet?
}

extension PasswordChangeHistory {

    @objc(addPasswordObject:)
    @NSManaged public func addToPassword(_ value: Password)

    @objc(removePasswordObject:)
    @NSManaged public func removeFromPassword(_ value: Password)

    @objc(addPassword:)
    @NSManaged public func addToPassword(_ values: NSSet)

    @objc(removePassword:)
    @NSManaged public func removeFromPassword(_ values: NSSet)
}

extension PasswordChangeHistory : Identifiable {

}

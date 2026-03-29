//
//  UserProfile+CoreDataProperties.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//
//

import Foundation
import CoreData

extension UserProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfile> {
        return NSFetchRequest<UserProfile>(entityName: "UserProfile")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isPremiumUser: Bool
    @NSManaged public var name: String?
    @NSManaged public var profilePictureURL: String?
    @NSManaged public var activityLogs: NSSet?
}

extension UserProfile {

    @objc(addActivityLogsObject:)
    @NSManaged public func addToActivityLogs(_ value: UserActivityLog)

    @objc(removeActivityLogsObject:)
    @NSManaged public func removeFromActivityLogs(_ value: UserActivityLog)

    @objc(addActivityLogs:)
    @NSManaged public func addToActivityLogs(_ values: NSSet)

    @objc(removeActivityLogs:)
    @NSManaged public func removeFromActivityLogs(_ values: NSSet)
}

extension UserProfile : Identifiable {

}

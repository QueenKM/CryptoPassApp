//
//  UserProfileStorage.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation
import CoreData

class UserProfileStorage {
    private let context = CoreDataStack.shared.context

    func save(userProfileModel: UserProfileModel) {
        let userProfile = UserProfile(context: context)
        userProfile.id = userProfileModel.id
        userProfile.email = userProfileModel.email
        userProfile.name = userProfileModel.name
        userProfile.profilePictureURL = userProfileModel.profilePictureURL
        userProfile.isPremiumUser = userProfileModel.isPremiumUser
        
        do {
            try context.save()
            print("User profile saved to Core Data")
        } catch {
            print("Failed to save user profile: \(error.localizedDescription)")
        }
    }

    func loadAll() -> [UserProfileModel] {
        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            return results.map { userProfile in
                UserProfileModel(
                    id: userProfile.id ?? UUID(),
                    email: userProfile.email ?? "",
                    name: userProfile.name,
                    profilePictureURL: userProfile.profilePictureURL,
                    isPremiumUser: userProfile.isPremiumUser
                )
            }
        } catch {
            print("Failed to fetch user profiles: \(error.localizedDescription)")
            return []
        }
    }
}

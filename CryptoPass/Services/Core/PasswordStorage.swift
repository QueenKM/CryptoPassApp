//
//  PasswordStorage.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation
import CoreData

class PasswordStorage {
    private let context = CoreDataStack.shared.context

    func save(passwordModel: PasswordModel) {
        let password = Password(context: context)
        password.id = passwordModel.id
        password.serviceName = passwordModel.serviceName
        password.username = passwordModel.username
        password.encryptedPassword = passwordModel.encryptedPassword
        password.category = passwordModel.category.rawValue
        password.createdDate = passwordModel.createdDate
        password.notes = passwordModel.notes
        
        do {
            try context.save()
            print("Password saved to Core Data")
        } catch {
            print("Failed to save password: \(error.localizedDescription)")
        }
    }

    func loadAll() -> [PasswordModel] {
        let fetchRequest: NSFetchRequest<Password> = Password.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            return results.map { password in
                PasswordModel(
                    id: password.id ?? UUID(),
                    serviceName: password.serviceName ?? "",
                    username: password.username ?? "",
                    encryptedPassword: password.encryptedPassword ?? "",
                    category: PasswordCategory(rawValue: password.category ?? "Other") ?? .other,
                    createdDate: password.createdDate ?? Date(),
                    notes: password.notes
                )
            }
        } catch {
            print("Failed to fetch passwords: \(error.localizedDescription)")
            return []
        }
    }

    func delete(passwordModel: PasswordModel) {
        let fetchRequest: NSFetchRequest<Password> = Password.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", passwordModel.id as CVarArg)

        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
            try context.save()
            print("Password deleted from Core Data")
        } catch {
            print("Failed to delete password: \(error.localizedDescription)")
        }
    }

    func updatePassword(id: UUID, newEncryptedPassword: String) {
        let fetchRequest: NSFetchRequest<Password> = Password.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let results = try context.fetch(fetchRequest)
            if let password = results.first {
                password.encryptedPassword = newEncryptedPassword
                try context.save()
                print("Password updated in Core Data")
            } else {
                print("Password not found")
            }
        } catch {
            print("Failed to update password: \(error.localizedDescription)")
        }
    }
}

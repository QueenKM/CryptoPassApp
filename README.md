# CryptoPassApp

CryptoPassApp is a SwiftUI password manager project for Apple platforms, focused on secure password storage workflows, biometric authentication, and a clean application structure for iOS and macOS.

## Overview

This repository now includes a public-safe source snapshot of the real project.

The current visible code shows work across:

- SwiftUI screens for login, registration, navigation, and password browsing
- biometric authentication using `LocalAuthentication`
- password domain models and Core Data entities
- encryption using `CryptoKit`
- Firebase-based authentication and password sync integration
- unit and UI test coverage
- Xcode project metadata with package dependencies

## Tech Stack

- Swift
- SwiftUI
- Xcode project (`.xcodeproj`)
- Core Data
- CryptoKit
- Firebase Auth
- Firebase Firestore
- Firebase Analytics

## Source Snapshot

The repository currently exposes a curated public subset of the project:

```text
CryptoPass/
├── CryptoPassApp.swift
├── CryptoPass.entitlements
├── Assets.xcassets/
├── Models/
│   ├── CoreData/
│   └── PlainModels/
├── Services/
│   ├── Analytics/
│   ├── Application/
│   ├── Cloud/
│   ├── Core/
│   └── Security/
├── ViewModels/
└── Views/

CryptoPassTests/
CryptoPassUITests/
CryptoPass.xcodeproj/
```

## Features Visible In The Source

- email/password registration and login flows
- biometric unlock flow from the app landing screen
- password list UI with category-based data
- add-password flow with validation and encryption
- app-level authentication state handling
- encryption helper backed by `CryptoKit` and Keychain storage
- Firestore integration for saving and retrieving password records
- Core Data storage for passwords and user profile data
- unit tests and UI flow tests

## Local Setup

1. Open `CryptoPass.xcodeproj` in Xcode.
2. Ensure Swift Package dependencies resolve successfully.
3. Create a local `GoogleService-Info.plist` from `CryptoPass/GoogleService-Info.example.plist`.
4. Add your own Firebase project values to that local plist.
5. Build and run the `CryptoPass` target on a supported Apple simulator or device.

## Dependencies

The Xcode project references packages including:

- `firebase-ios-sdk`
- `GoogleSignIn-iOS`
- `CryptoSwift`

These are configured through Swift Package Manager in the checked-in Xcode project.

## Security Notes

Private Firebase configuration is intentionally not committed to the public repository.

Use the included `CryptoPass/GoogleService-Info.example.plist` as a template and create your own local `GoogleService-Info.plist` when configuring Firebase.

## Screenshots

Screenshots are not yet included in the repository. Adding a few app screenshots is the strongest remaining presentation improvement for this portfolio project.

## Known Issue

An existing build log in the project suggests duplicate generated file entries for several Core Data model files during Xcode builds.

That likely means the project still contains overlapping references to some generated Core Data files and would benefit from one more cleanup pass inside Xcode.

## Repository Cleanup Status

This repository originally contained an uploaded archive instead of visible source files. That has now been substantially improved by publishing representative source code, tests, assets, and Xcode project metadata directly into the repo.

## Next Improvements

- add screenshots of the app UI
- document Firebase setup in more detail
- remove outdated archive-only artifacts once the full source import is complete
- clean up duplicate Core Data references in the Xcode project
- continue aligning the repo history with the real local project structure

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

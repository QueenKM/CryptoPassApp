# CryptoPassApp

CryptoPassApp is a SwiftUI password manager project for Apple platforms, focused on secure password storage workflows, biometric authentication, and a clean application structure for iOS and macOS.

## Overview

This repository now includes a public-safe source snapshot of the real project.

The current visible code shows work across:

- SwiftUI screens for login, registration, navigation, and password browsing
- biometric authentication using `LocalAuthentication`
- password domain models and view models
- encryption using `CryptoKit`
- Firebase-based authentication and password sync integration
- unit and UI test coverage

## Source Snapshot

The repository currently exposes a curated public subset of the project:

```text
CryptoPass/
├── CryptoPassApp.swift
├── CryptoPass.entitlements
├── Models/PlainModels/
├── Services/
│   ├── Cloud/
│   ├── Core/
│   └── Security/
├── ViewModels/
└── Views/

CryptoPassTests/
CryptoPassUITests/
```

## Features Visible In The Source

- email/password registration and login flows
- biometric unlock flow from the app landing screen
- password list UI with category-based data
- app-level authentication state handling
- encryption helper backed by `CryptoKit` and Keychain storage
- Firestore integration for saving and retrieving password records
- view model tests and UI flow tests

## Security Notes

Private Firebase configuration is intentionally not committed to the public repository.

Use the included `CryptoPass/GoogleService-Info.example.plist` as a template and create your own local `GoogleService-Info.plist` when configuring Firebase.

## Repository Cleanup Status

This repository originally contained an uploaded archive instead of visible source files. That has now been partially corrected by publishing representative source code directly into the repo.

The next cleanup step is to continue replacing archive-first content with the remaining safe source files and to remove outdated placeholder artifacts from the repository history.

## Next Improvements

- publish the remaining safe project files in the same clean structure
- add screenshots of the app UI
- document local setup and Firebase configuration steps
- remove outdated archive-only artifacts once the full source import is complete

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

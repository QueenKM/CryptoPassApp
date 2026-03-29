//
//  ContentView.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 23.12.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    @State private var showBiometricPrompt: Bool = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                MainMenuView()
            } else {
                VStack {
                    Text("Welcome to CryptoPass")
                        .font(.largeTitle)
                        .padding()
                    
                    if showBiometricPrompt {
                        Button(action: authenticateWithBiometrics) {
                            HStack {
                                Image(systemName: "faceid")
                                Text("Login with FaceID")
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .padding()
                .onAppear {
                    checkBiometricAvailability()
                }
            }
        }
    }
    
    private func checkBiometricAvailability() {
        let biometricService = BiometricService()
        biometricService.authenticateUser { success, _ in
            DispatchQueue.main.async {
                if success {
                    isLoggedIn = true
                } else {
                    showBiometricPrompt = true
                }
            }
        }
    }
    
    private func authenticateWithBiometrics() {
        let biometricService = BiometricService()
        biometricService.authenticateUser { success, _ in
            DispatchQueue.main.async {
                if success {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

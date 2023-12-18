//
//  SettingView.swift
//  RohanDada
//
//  Created by Rohan Sakhare on 19/12/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool // Corrected the name here

    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true // Corrected the assignment here
                    } catch {
                        // Handle error, e.g., display an alert
                        print("Error signing out: \(error)")
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(showSignInView: .constant(true))
        }
    }
}

//
//  signinEmailView.swift
//  RohanDada
//
//  Created by Rohan Sakhare on 18/12/23.
//

import SwiftUI
@MainActor
final class SignInEmailViweModel : ObservableObject {
    @Published var Email = ""
    @Published var Password = ""
    
    func signIn() {
        guard !Email.isEmpty, !Password.isEmpty else {
            print("No email or password found.")
            return
        }

        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: Email, password: Password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }

}

struct signinEmailView: View {
    @StateObject private var viewModel = SignInEmailViweModel()
    var body: some View {
        VStack{
            TextField("Email...",text: $viewModel.Email)
                .padding()
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
            TextField("Password...",text: $viewModel.Password)
                .padding()
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewModel.signIn()
                
            }
            label :{
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In with Email")
    }
}

#Preview {
    NavigationStack {
        signinEmailView()
    }
}

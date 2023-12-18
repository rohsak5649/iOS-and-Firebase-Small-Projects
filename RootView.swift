//
//  RootView.swift
//  RohanDada
//
//  Created by Rohan Sakhare on 19/12/23.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false

    var body: some View {
       
            ZStack {
                NavigationStack{
                    SettingsView(showSignInView: $showSignInView)
                }
            }
            .onAppear {
                let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showSignInView = authUser == nil
            }
            .fullScreenCover(isPresented: $showSignInView) {
                
                NavigationStack {
                    AuthenticationView()
                }
            }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

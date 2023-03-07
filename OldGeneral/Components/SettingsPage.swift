//
//  Settings.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct SettingsPage: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var loggedOut: Bool = false
    var body: some View {
        ScrollView {
            Button {
                signout()
            } label: {
                Text("退出登陆")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                    .tint(.teal)
                    .underline()
            }
            .buttonStyle(.plain)
        }
        .navigationDestination(isPresented: $loggedOut, destination: {
            LoginPage()
        })
        .padding()
    }
    
    func signout() {
        RemoveToken()
        loggedOut = true
        isLogined = false
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: OldgeneralContentView())
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

//
//  Settings.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct SettingsPage: View {
    @State private var loggedOut: Bool = false
    var body: some View {
        ScrollView {
            Button {
                loggedOut = true
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
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

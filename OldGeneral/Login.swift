//
//  Login.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct Login: View {
    @State private var UserName: String = ""
    @State private var Password: String = ""
    var body: some View {
        NavigationView {
            GroupBox()  {
                VStack{
                    Spacer()
                    HStack {
                        Spacer().frame(width: 70)
                        VStack {
                            Text("Hello, World!")
                            HStack{
                                Text("账号: ")
                                TextField("", text: $UserName)
                            }
                            HStack{
                                Text("密码: ")
                                TextField("", text: $Password)
                            }
                            HStack {
                                NavigationLink(destination: Regester()) {
                                    Text("注册")
                                        .frame(maxWidth: .infinity)
                                        .tint(.indigo)
                                }
                                NavigationLink(destination: Main()) {
                                    Text("登陆")
                                        .frame(maxWidth: .infinity)
                                        .tint(.indigo)
                                }
                            }
                        }
                        Spacer().frame(width: 70)
                    }
                    Spacer()
                }
            }
            .frame(maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                print("lose focus")
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

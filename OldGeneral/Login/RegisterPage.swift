//
//  Regester.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI
import Combine

struct RegisterPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @State private var showPassword: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var errorMsg: String = " "
    var body: some View {
        VStack{
            Spacer()
            GroupBox{
                HStack{
                    Spacer().frame(width: 40)
                    VStack {
                        Text("注 册")
                        HStack {
                            Text("账号: ")
                            TextField("UserName",text: $username)
                                .onReceive(Just(username)) { newValue in
                                    let filtered = newValue.filter { inputFilter.contains($0) }
                                    let limited = filtered.prefix(30)
                                    if filtered != newValue {
                                        self.username = String(limited)
                                    }
                                }
                        }
                        HStack {
                            Text("密码: ")
                            if showPassword {
                                TextField("Password", text: $password)
                                    .keyboardType(.asciiCapable)
                            } else {
                                SecureField("Password",text: $password)
                            }
                        }
                        .onReceive(Just(password)) { newValue in
                            let filtered = newValue.filter { inputFilter.contains($0) }
                            let limited = filtered.prefix(30)
                            if filtered != newValue {
                                self.password = String(limited)
                            }
                        }
                        .overlay(
                            HStack {
                                Spacer()
                                Toggle(isOn: $showPassword) {
                                    Image(systemName: showPassword ? "eye" : "eye.slash")
                                }
                                .padding(.trailing, 10)
                                .toggleStyle(.button)
                                .buttonStyle(.plain)
                            })
                        HStack {
                            Text("确认: ")
                            if showPassword {
                                TextField("Confirm Password",text: $confirmpassword)
                                    .keyboardType(.asciiCapable)
                            } else {
                                SecureField("Confirm Password",text: $confirmpassword)
                            }
                        }
                        .onReceive(Just(confirmpassword)) { newValue in
                            let filtered = newValue.filter { inputFilter.contains($0) }
                            let limited = filtered.prefix(30)
                            if filtered != newValue {
                                self.confirmpassword = String(limited)
                            }
                        }
                        Text(errorMsg)
                            .foregroundColor(.red)
                        Button {
                            guard password == confirmpassword  else {
                                errorMsg = "两次密码不相同"
                                return
                            }
                            
                            guard Register(username: username, password: password) else {
                                errorMsg = "注册失败"
                                return
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("注 册")
                                .padding([.leading,.trailing],20)
                        }
                        .buttonStyle(.bordered)
                        .padding(.leading,50)
                    }
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxHeight: .infinity)
                    Spacer().frame(width: 40)
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}

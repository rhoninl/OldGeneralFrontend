//
//  Login.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI
import Combine

let passwordError: String = "账号或者密码错误"
let inputFilter: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"

struct LoginPage: View {
    @State private var UserName: String = ""
    @State private var Password: String = ""
    @State private var loggedIn = false
    @State private var loginError = false
    @State private var Registed = false
    @State private var showPassword = false
    var body: some View {
        NavigationStack {
            GroupBox()  {
                VStack{
                    Spacer()
                        .frame(height: 130)
                    HStack {
                        Spacer().frame(width: 50)
                        VStack {
                            Image("Icon")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .padding()
                            Text("守住你的戏台，老将军!")
                                .padding()
                            HStack{
                                Text("账号: ")
                                TextField("UserName", text: $UserName)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                    .onReceive(Just(UserName)) { newValue in
                                        let filtered = newValue.filter { inputFilter.contains($0) }
                                        let limited = filtered.prefix(30)
                                        if limited != newValue {
                                            self.UserName = String(limited)
                                        }
                                    }
                            }
                            HStack{
                                Text("密码: ")
                                VStack{
                                    if showPassword {
                                        TextField("Password", text: $Password)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled()
                                            .keyboardType(.asciiCapable)
                                    } else {
                                        SecureField("Password", text: $Password)
                                    }
                                }
                                .onReceive(Just(Password)) { newValue in
                                    let filtered = newValue.filter { inputFilter.contains($0) }
                                    let limited = filtered.prefix(30)
                                      if filtered != newValue {
                                          self.Password = String(limited)
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
                            }
                            HStack{
                                Text("\(loginError ? passwordError : " ")")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            HStack {
                                Button {
                                    Registed = true
                                } label: {
                                    Text("注册")
                                        .padding([.leading,.trailing],15)
                                }
                                
                                Spacer()
                                
                                Button {
                                    if Login(username: UserName, password: Password) {
                                        loggedIn = true
                                        print("Login success")
                                    }else {
                                        loginError = true
                                        print("Login failed")
                                    }
                                } label: {
                                    Text("登陆")
                                        .padding([.leading,.trailing],15)
                                }
                            }
                        }
                        Spacer().frame(width: 50)
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
            .navigationDestination(isPresented: $loggedIn) {
                Main()
            }
            .navigationDestination(isPresented: $Registed) {
                RegisterPage()
            }
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
        .navigationBarBackButtonHidden()
        .keyboardType(.asciiCapable)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

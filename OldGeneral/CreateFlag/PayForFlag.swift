//
//  PayForFlag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/17.
//

import SwiftUI

struct PayForFlag: View {
    @State private var money: Int = 6
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack{
            Form {
                Section(){
                    VStack{
                        Text("💰为你的Flag充个钱吧💰")
                        LazyVGrid(columns: columns){
                            Button {
                                money = 6
                            } label: {
                                Text("6金")
                                    .padding([.leading,.trailing],16)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 32
                            } label: {
                                Text("32金")
                                    .padding([.leading,.trailing],12)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 66
                            } label: {
                                Text("66金")
                                    .padding([.leading,.trailing],12)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 128
                            } label: {
                                Text("128金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 256
                            } label: {
                                Text("256金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 648
                            } label: {
                                Text("648金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            
                        }
                        .buttonStyle(.bordered)
                        .controlGroupStyle(.navigation)
                    }
                    HStack{
                        Spacer()
                            .frame(width: 77)
                        Text("自己输 👉")
                            .font(.caption)
                        TextField("",value: $money, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .onChange(of: money) { newValue in
                                if newValue > 9999 {
                                    money = Int(String(money).prefix(4)) ?? 0
                                } else if newValue <= 6 {
                                    money = 6
                                }
                            }
                        
                        Text("金")
                        Spacer()
                            .frame(width: 77)
                    }
                    .padding(3)
                }
            }
            .onTapGesture {
                print("lose focus")
                // dismiss keyboard when tap the from
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }

            Button {
            } label: {
                Text("支付")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
        }
        .foregroundColor(.primary)
    }
}

struct PayForFlag_Previews: PreviewProvider {
    static var previews: some View {
        PayForFlag()
    }
}

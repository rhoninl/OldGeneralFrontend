//
//  PayForFlag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/17.
//

import SwiftUI

struct PayForFlag: View {
    var flagName: String = ""
    var startDate: Int64 = today()
    var totalTime: Int64 = 0
    var goldNum: Int64 = 399
    @State private var alert: Bool = false
    @State private var money: Int64 = 6
    @State private var flagInfo = Cdr_FlagBasicInfo()
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack{
            Form {
                Section("🚩Flag 信息") {
                    VStack(alignment: .leading,spacing: 7){
                        Text("Flag 名称: \(flagName)")
                            .lineLimit(1)
                        Text("从 \(timestampToDate(startDate)) 开始，坚持 \(totalTime) 天")
                    }
                    .font(.footnote)
                    .padding(.all,1)
                }
                .textCase(nil)
                
                Section(){
                    VStack{
                        Text("💰为你的Flag充个钱吧💰")
                            .font(.subheadline)
                        LazyVGrid(columns: columns){
                            Button {
                                money = 6
                                CheckMoney()
                            } label: {
                                Text("6金")
                                    .padding([.leading,.trailing],16)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 32
                                CheckMoney()
                            } label: {
                                Text("32金")
                                    .padding([.leading,.trailing],12)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 66
                                CheckMoney()
                            } label: {
                                Text("66金")
                                    .padding([.leading,.trailing],12)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 128
                                CheckMoney()
                            } label: {
                                Text("128金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 256
                                CheckMoney()
                            } label: {
                                Text("256金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            Button {
                                money = 648
                                CheckMoney()
                            } label: {
                                Text("648金")
                                    .padding([.leading,.trailing],7)
                            }
                            .cornerRadius(14)
                            
                        }
                        .buttonStyle(.bordered)
                        .controlGroupStyle(.navigation)
                    }
                    .font(.caption)
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
                                    money = Int64(String(money).prefix(4)) ?? 0
                                    CheckMoney()
                                } else if newValue > goldNum {
                                    money = goldNum
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
            VStack(alignment: .trailing){
                NavigationLink{
                    WalletPage()
                }label: {
                    Text("当前 \(goldNum) 💰")
                        .font(.caption2)
                }
                .buttonStyle(.bordered)
                .tint(.orange)
                HStack{
                    Button {
                        flagInfo.name = flagName
                        flagInfo.totalTime = totalTime
                        flagInfo.startTime = startDate
                        flagInfo.challengeNum = goldNum
                        flagInfo.userID = userId
                        alert = true
                    } label: {
                        Text("支付")
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.yellow)
                    .disabled(goldNum < 6)
                    .alert(isPresented: $alert) {
                        Alert(title: Text("支付提醒"), message: Text("请确认您的flag信息，并确认支付该flag")
                              , primaryButton: .default(Text("确认支付")){
                            if  CreateFlag(data: flagInfo) {
                                let windowsScene =  UIApplication.shared.connectedScenes.first as? UIWindowScene
                                windowsScene?.keyWindow?.rootViewController = UIHostingController(rootView: OldgeneralContentView())
                                windowsScene?.keyWindow?.makeKeyAndVisible()
                            }
                        },secondaryButton: .destructive(Text("我再想想")))
                    }
                }
            }
        }
        .foregroundColor(.primary)
    }
    func CheckMoney() {
        if money > goldNum {
            money = goldNum
        }
    }
}

struct PayForFlag_Previews: PreviewProvider {
    static var previews: some View {
        PayForFlag(flagName: "flagName")
    }
}

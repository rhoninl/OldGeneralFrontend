//
//  CreateFlag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/5.
//

import SwiftUI

struct CreateFlagView: View {
    @State private var flagName: String = ""
    @State private var wordCount: Int = 0
    @State private var test: String = ""
    @State private var startToday: Bool = true
    @FocusState private var flagNameIsFocus: Bool
    @FocusState private var costomDays: Bool
    @State private var maskAlert = false
    @State private var messageAlert = false
    @State private var flagNameIllegal = false
    @State private var days: Int64 = 7
    private var wordMax: Int = 40
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("🚩Flag名称")) {
                    VStack(alignment: .leading){
                        TextEditor(text: $flagName)
                            .font(.headline)
                            .lineSpacing(5)
                            .onChange(of: flagName) { _ in
                                flagNameIllegal = false
                                if flagName.count > wordMax {
                                    self.flagName = String(flagName.prefix(wordMax))
                                }
                                self.wordCount = flagName.count
                            }
                            .foregroundColor(wordCount < wordMax ? .primary : Color.red)
                            .scrollContentBackground(.hidden)
                            .autocorrectionDisabled()
                            .frame(height: 100)
                            .padding(.all,5)
                            .focused($flagNameIsFocus)
                            .overlay(alignment: .bottomTrailing) {
                                Text("\(wordCount)/\(wordMax)")
                                    .font(.headline)
                                    .foregroundColor(flagNameIllegal || wordCount < wordMax ? .secondary : .red)
                                    .padding([.bottom, .trailing],10.0)
                            }
                    }
                }
                .textCase(.none)
                Section(header:Text("💪坚持天数")){
                    HStack(spacing: 15.0){
                        Button("30天") {
                            days = 30
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.primary)
                        .background(days == 30 ? .gray : Color("CardColor"))
                        
                        .cornerRadius(20)
                        Button("90天") {
                            days = 90
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.primary)
                        .background(days == 90 ? .gray : Color("CardColor"))
                        .cornerRadius(20)
                        Button("360天") {
                            days = 360
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.primary)
                        .background(days == 360 ? .gray : Color("CardColor"))
                        .cornerRadius(20)
                        TextField("自己定",value: $days, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 60.0)
                            .onChange(of: days) { newValue in
                                if newValue > 9999 {
                                    days = Int64(String(days).prefix(4)) ?? 0
                                }else if newValue <= 7 {
                                    days = 7
                                }
                            }
                            .focused($costomDays)
                        Text("天")
                    }
                    HStack{
                        Text("你将获得 \(days / 7) 副面具🎭, 并获得 \(days >= 30 ? 1 : 0) 个备用戏台🏬.")
                        Spacer()
                        Image(systemName: "questionmark.circle.fill")
                            .onTapGesture {
                                self.maskAlert = true
                            }
                            .alert(isPresented: $maskAlert) {
                                Alert(title: Text("Q&A"), message: Text("面具🎭：跳过改天的打卡\n备用戏台🏬：复活该Flag")
                                      , dismissButton: .default(Text("我知道了！")))
                            }
                    }
                }
                Section(header: Text("从那天开始？")){
                    HStack(spacing: 30){
                        Button("从今天开始") {
                            startToday = true
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.primary)
                        .background(startToday ? .gray : Color("CardColor"))
                        .cornerRadius(20)
                        Button("从明天开始") {
                            startToday = false
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.primary)
                        .background(startToday ? Color("CardColor") : .gray)
                        .cornerRadius(20)
                    }
                }
                
            }
            .formStyle(.grouped)
            .font(.caption)
            .onTapGesture {
                print("lose focus")
                // dismiss keyboard when tap the from
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            NavigationLink {
                PayForFlag(flagName: flagName,startDate: startToday ? today() : tomorrow(),totalTime: days)
            } label: {
                Text("开干!")
                    .frame(maxWidth: .infinity,minHeight: 40)
                    .foregroundColor(.primary)
                    .background(.yellow)
                    .cornerRadius(10)
            }
            .padding()
            .buttonStyle(.plain)
            .disabled(flagName.isEmpty)
            .onTapGesture {
                if flagName.isEmpty {
                    flagNameIllegal = true
                }
            }

        }
    }
}

struct CreateFlagView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlagView()
    }
}

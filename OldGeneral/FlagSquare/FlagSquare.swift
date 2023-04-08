//
//  FlagSquare.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct FlagSquare: View {
    @State private var currentPage:Int64 = 0
    @State private var SearchString: String = ""
    @State var signInSquareStore: [Cdr_FlagSquareItemInfo] = []
    @State private var isFetching: Bool = false
    @State private var lastSignInId: String = ""
    @State private var hasAnyMore: Bool = true
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack{
                    SearchBar(searchText: $SearchString,onSearchButtonClicked: handleSearch)
                    ScrollView() {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(signInSquareStore, id: \.self) { index in
                                NavigationLink{
                                    SignInPage(signInId: index.signinID)
                                } label: {
                                    FlagSquareItem(info: index)
                                }
                                .buttonStyle(.borderless)
                                .onAppear{
                                    if !isFetching &&
                                        hasAnyMore &&
                                        index == signInSquareStore.last {
                                        print("fetch")
                                        Task{
                                            await fetchSquare()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding([.leading,.trailing],10)
                    .refreshable {
                        Task {
                            try await Task.sleep(nanoseconds: UInt64(MS * 500))
                            signInSquareStore = []
                            await initSquare()
                        }
                    }
                }
                
                NavigationLink {
                    CreateFlagView()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.yellow)
                        .padding(.trailing,50)
                        .padding(.bottom,20)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .onTapGesture {
            print("lose focus")
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .onAppear {
            guard signInSquareStore.isEmpty else {
                    return
            }
            
            Task{
                await initSquare()
            }
        }
    }
 
    func handleSearch() {
        print("Search button clicked with text: \(SearchString)")
    }
    func fetchSquare() async {
        guard hasAnyMore else {
            print("has reached buttom")
            return
        }
        isFetching = true
        defer {
            isFetching = false
            lastSignInId = signInSquareStore.last!.signinID
        }
        let fetchedData = fetchFlagSquareList(currentPage)
        if  fetchedData.count < pagesize {
            hasAnyMore = false
        }
        currentPage += 1
        signInSquareStore += fetchedData
    }
    
    func initSquare() async {
        if ispreview {
            return
        }
        isFetching = true
        defer {
            isFetching = false
            lastSignInId = signInSquareStore.last?.signinID ?? ""
        }
        let fetchedData = fetchFlagSquareList(0)
        
        if  fetchedData.count < pagesize {
            hasAnyMore = false
        }
        
        currentPage = 1
        signInSquareStore = fetchedData
    }
}

struct FlagSquare_Previews: PreviewProvider {
    static var previews: some View {
        if preview() {}
        FlagSquare()
    }
}

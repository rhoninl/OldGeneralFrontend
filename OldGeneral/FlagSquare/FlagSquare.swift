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
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack{
                    SearchBar(searchText: $SearchString,onSearchButtonClicked: handleSearch)
                    ScrollView() {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(signInSquareStore, id: \.self) { index in
                                NavigationLink{
                                    SignInPage()
                                } label: {
                                    FlagSquareItem(info: index)
                                }
                                .buttonStyle(.plain)
                                .onAppear{
                                    if !isFetching && index == signInSquareStore[signInSquareStore.count - 4] {
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
        isFetching = true
        defer {isFetching = false}
        usleep(500000)
        let fetchedData = fetchFlagSquareList(currentPage)
        guard fetchedData.count != 0 else {
            return
        }
        currentPage += 1
        signInSquareStore += fetchedData
    }
    
    func initSquare() async {
        if ispreview {
            return
        }
        isFetching = true
        defer {isFetching = false}
        let fetchedData = fetchFlagSquareList(0)
        guard fetchedData.count != 0 else {
            return
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

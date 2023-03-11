//
//  FlagSquare.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI
import WaterfallGrid

struct FlagSquare: View {
    @State private var SearchString: String = ""
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack{
                    SearchBar(searchText: $SearchString,onSearchButtonClicked: handleSearch)
                    ScrollView(showsIndicators: true) {
                        WaterfallGrid((1..<10), id: \.self) { index in
                            NavigationLink{
                                FlagInfoPage()
                            } label: {
                                FlagSquareItem(imageName: "image\(index)")
                            }
                            .buttonStyle(.plain)
                        }
                        .gridStyle(spacing:13)
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
    }
    func handleSearch() {
        print("Search button clicked with text: \(SearchString)")
    }
}

struct FlagSquare_Previews: PreviewProvider {
    static var previews: some View {
        FlagSquare()
    }
}

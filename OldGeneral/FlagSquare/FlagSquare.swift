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
                            FlagSquareItem(imageName: "image\(index)")
                        }
                        .gridStyle(spacing:13)
                    }
                }
                
                NavigationLink {
                    CreateFlag()
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

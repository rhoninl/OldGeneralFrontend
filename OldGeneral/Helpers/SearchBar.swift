//
//  SearchBar.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/24.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchText: String
    var onSearchButtonClicked: (() -> Void)?

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchText: String
        var onSearchButtonClicked: (() -> Void)?

        init(searchText: Binding<String>, onSearchButtonClicked: (() -> Void)? = nil) {
            _searchText = searchText
            self.onSearchButtonClicked = onSearchButtonClicked
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.searchText = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            onSearchButtonClicked?()
        }
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "搜一搜"
        searchBar.backgroundImage = UIImage()
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(searchText: $searchText, onSearchButtonClicked: onSearchButtonClicked)
    }
}


//
//  circleImage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/13.
//

import SwiftUI

struct circleImage: View {
    var url: String
    var defaultImage: String = "avatar"
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            default :
                Image(defaultImage)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            }
        }
    }
}

struct circleImage_Previews: PreviewProvider {
    static var previews: some View {
        circleImage(url: "https://as1.ftcdn.net/v2/jpg/03/03/97/00/1000_F_303970065_Yi0UpuVdTb4uJiEtRdF8blJLwcT4Qd4p.jpg")
    }
}

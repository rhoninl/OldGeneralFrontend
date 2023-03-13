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
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            default :
                Image(defaultImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }
        }
    }
}

struct circleImage_Previews: PreviewProvider {
    static var previews: some View {
        circleImage(url: "123")
    }
}

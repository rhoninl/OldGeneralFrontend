//
//  fullScreenPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/14.
//

import SwiftUI

struct FullScreenImageOverlay: View {
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.8))
            .edgesIgnoringSafeArea(.all)
    }
}

struct FullScreenImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImageOverlay(image: UIImage(systemName: "person.crop.circle.fill")!)
    }
}

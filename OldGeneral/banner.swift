//
//  banner.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2022/12/24.
//

import SwiftUI

struct Banner: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    @State private var showSplashScreen = true
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .ignoresSafeArea()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var data:Data?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async { self.data = data }
        }
        task.resume()
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(withURL: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.3gbizhi.com%2F2020%2F0919%2F20200919020101662.jpg&refer=http%3A%2F%2Fpic.3gbizhi.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1674476425&t=2e59d8338374739a3938519c86a8158e")
    }
}

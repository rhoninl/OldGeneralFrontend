//
//  ContentView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

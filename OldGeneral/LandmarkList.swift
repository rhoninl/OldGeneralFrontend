//
//  LandmarkList.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2022/12/10.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavouriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{landmark in
            (!showFavouriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavouriteOnly) {
                    Text("Favourite Only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("LandMarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

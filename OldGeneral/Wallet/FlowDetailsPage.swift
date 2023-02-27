//
//  FlowDetailsPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct FlowDetailsPage: View {
    var body: some View {
        List{
            FlowDetailItem()
            FlowDetailItem()
        }
    }
}

struct FlowDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        FlowDetailsPage()
    }
}

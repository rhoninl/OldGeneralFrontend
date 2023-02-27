//
//  SwiftUIView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct FlowDetailItem: View {
    private var FlagName: String = "This is Flag Name (Info)"
    private var TimeStamp: String = "2023-01-01 12:12"
    private var GoldChange: Int = -10
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(FlagName)
                HStack{
                    Text(TimeStamp)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Text("\(GoldChange)")
                .foregroundColor(GoldChange < 0 ? .primary : .orange)
        }
        .padding(.all,3)
    }
}

struct FlowDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        FlowDetailItem()
    }
}

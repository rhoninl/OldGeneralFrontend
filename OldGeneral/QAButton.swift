//
//  QAButton.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct QAButton: View {
    var body: some View {
        VStack{
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 20))
            Text("Q&A")
                .padding(.top, 8.0)
        }
    }
}

struct QAButton_Previews: PreviewProvider {
    static var previews: some View {
        QAButton()
    }
}

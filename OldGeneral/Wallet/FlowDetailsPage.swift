//
//  FlowDetailsPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct FlowDetailsPage: View {
    @State var waterfullList: [Cdr_WaterFlow] = []
    @State private var hasAnyMore: Bool = true
    @State private var isFetching: Bool = false
    @State private var currentPage: Int64 = 0
    var body: some View {
        List{
            ForEach(waterfullList, id: \.self) { index in
                FlowDetailItem(info: index)
                    .onAppear{
                        if !isFetching &&
                            hasAnyMore &&
                            index == waterfullList.last {
                            print("fetch")
                            Task {
                                await fetchWaterFlow()
                            }
                        }
                    }
            }
        }
        .refreshable {
            Task {
                try await Task.sleep(nanoseconds: UInt64(MS * 500))
                waterfullList = []
                hasAnyMore = true
                currentPage = 0
                await fetchWaterFlow()
            }
        }
        .onAppear {
            Task {
                await fetchWaterFlow()
            }
        }
    }
    func fetchWaterFlow() async {
        if ispreview{
            return
        }
        isFetching = true
        defer { isFetching = false }
        
        let fetchedData = FetchWaterFlow(currentPage)
        if fetchedData.count < pagesize {
            hasAnyMore = false
        }
        waterfullList += fetchedData
        currentPage += 1
    }
}

struct FlowDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        if preview(){}
        let wf = Cdr_WaterFlow.with{ my in
            my.content = "content"
            my.createdAt = getTimeStamp()
            my.goldNum = -10
            my.id = "123"
        }
        FlowDetailsPage(waterfullList: [wf,wf])
    }
}

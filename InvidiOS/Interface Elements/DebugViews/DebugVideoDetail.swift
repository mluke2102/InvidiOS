//
//  DebugVideoDetail.swift
//  InvidiOS
//
//  Created by Matt Luke on 7/11/22.
//

import SwiftUI

struct DebugVideoDetail: View {
    
    @State var inputID = ""
    
    var body: some View {
        VStack {
            List {
                TextField("Input a YouTube video ID", text: $inputID)
            }
            
            NavigationLink() {
                VideoDetailView(videoID: inputID)
            } label: {
                Text("Preview Video Detail View")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
                    .padding()
            }
        }.navigationTitle("Debug Video Detail")
            .background(Color(UIColor.systemGroupedBackground))
    }
}

struct DebugVideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        DebugVideoDetail()
    }
}

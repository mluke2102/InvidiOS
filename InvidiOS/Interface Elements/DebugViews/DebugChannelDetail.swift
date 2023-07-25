//
//  DebugChannelDetail.swift
//  InvidiOS
//
//  Created by Matt Luke on 7/11/22.
//

import SwiftUI

struct DebugChannelDetail: View {
    
    @State var inputID = ""
    
    var body: some View {
        VStack {
            List {
                TextField("Input a YouTube channel ID", text: $inputID)
            }
            
            NavigationLink() {
                ChannelDetailView(channelId: inputID)
            } label: {
                Text("Preview Channel Detail View")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
                    .padding()
            }
        }.navigationTitle("Debug Channel Detail")
            .background(Color(UIColor.systemGroupedBackground))
    }
}

struct DebugChannelDetail_Previews: PreviewProvider {
    static var previews: some View {
        DebugChannelDetail()
    }
}

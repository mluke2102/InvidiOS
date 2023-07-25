//
//  SubscribedChannelCell.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import SwiftUI

struct SubscribedChannelCell: View {
    var body: some View {
        HStack {
            Image("ProfilePlaceholder")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)

                Text("Channel Title")
                    .font(.headline)
                    .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct SubscribedChannelCell_Previews: PreviewProvider {
    static var previews: some View {
        SubscribedChannelCell()
    }
}

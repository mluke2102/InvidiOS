//
//  LargeVideoCellView.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import SwiftUI

struct LargeVideoCellView: View {
    

    
    var body: some View {
        
        VStack(spacing: 0.0){
            
//                AsyncImage(url: URL(string: "https://vid.puffyan.us/vi/7ca3a-0uRG4/mqdefault.jpg")){ image in
//                    image
//                        .resizable()
//
//                    } placeholder: {
//                        Color(UIColor.tertiarySystemBackground)
//                        ProgressView()
//                            .progressViewStyle(.circular)
//                }.aspectRatio(16/9, contentMode: .fit)
                
            Image("ThumbnailPlaceholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Image("ProfilePlaceholder")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    
                
                VStack(alignment: .leading) {
                    Text("Video Title")
                        .font(.headline)
                        .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Channel - 0 Views - 1 day ago")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            
        }.background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.top)
        .padding(.leading)
        .padding(.trailing)

        
        
    }
}

struct LargeVideoCellView_Previews: PreviewProvider {
    static var previews: some View {
        LargeVideoCellView()
            .preferredColorScheme(.dark)
    }
}

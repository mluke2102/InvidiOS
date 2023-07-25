//
//  TrendingView.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import SwiftUI

struct TrendingView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                LargeVideoCellView()
                LargeVideoCellView()
                LargeVideoCellView()
                LargeVideoCellView()
                LargeVideoCellView()
                LargeVideoCellView()
            }
            .navigationTitle("Trending")
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}

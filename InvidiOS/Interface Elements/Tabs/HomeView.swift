//
//  HomeView.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import SwiftUI

struct HomeView: View {
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
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

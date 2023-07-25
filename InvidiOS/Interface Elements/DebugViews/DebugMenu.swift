//
//  DebugMenu.swift
//  InvidiOS
//
//  Created by Matt Luke on 7/11/22.
//

import SwiftUI

struct DebugMenu: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Cloud kit") {
                    NavigationLink {
                        DebugSubscription()
                    } label: {
                        Text("Manually add subscription")
                    }
                }
                
                Section("Detail Views") {
                    NavigationLink {
                        DebugVideoDetail()
                    } label: {
                        Text("Input video ID")
                    }
                    
                    NavigationLink {
                        DebugChannelDetail()
                    } label: {
                        Text("Input channel ID")
                    }
                    
                }
                
                
                
            }.navigationTitle("Debug Menu")
            
        }
    }
}

struct DebugMenu_Previews: PreviewProvider {
    static var previews: some View {
        DebugMenu()
    }
}

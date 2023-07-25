//
//  SubscriptionsView.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import SwiftUI

struct SubscriptionsView: View {
    
    @State var currentFeedImage = "person.crop.rectangle.stack.fill"
    
    @State var isVideoFeed = false
    
    var body: some View {
        
        
        
        NavigationView {
            

            if isVideoFeed {
                ScrollView{
                    LargeVideoCellView()
                    LargeVideoCellView()
                    LargeVideoCellView()
                    LargeVideoCellView()
                    LargeVideoCellView()
                    LargeVideoCellView()
                }            .navigationTitle("Subscriptions")
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Menu {
                                Button(action: {isVideoFeed = false}) {
                                    Label("Channels", systemImage: "person.crop.rectangle.stack.fill")
                                }

                                Button(action: {isVideoFeed = true}) {
                                    Label("Latest Uploads", systemImage: "play.rectangle.on.rectangle.fill")
                                }
                            } label: {
                                Label("Change Feed", systemImage: "play.rectangle.on.rectangle.fill")
                                    .padding(.trailing)
                            }
                        }
                    }
            } else {
                List() {

                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()
                    SubscribedChannelCell()



                }            .navigationTitle("Subscriptions")
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Menu {
                                Button(action: {isVideoFeed = false}) {
                                    Label("Channels", systemImage: "person.crop.rectangle.stack.fill")
                                }

                                Button(action: {isVideoFeed = true}) {
                                    Label("Latest Uploads", systemImage: "play.rectangle.on.rectangle.fill")
                                }
                            } label: {
                                Label("Change Feed", systemImage: "person.crop.rectangle.stack.fill")
                                    .padding(.trailing)
                            }
                        }
                    }
            }
            

        }
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}

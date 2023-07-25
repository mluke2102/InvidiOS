//
//  TrendingVideo.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/4/22.
//

import Foundation

struct VideoResult : Decodable, Hashable {
    
    var title: String
    var videoId: String
    var author: String
    var authorId: String
    var authorUrl: String
    var videoThumbnails: [VideoThumbnails]
    var description: String
    var viewCount: Int
    var published: Int
    var publishedText: String
    var lengthSeconds: Int
    var liveNow: Bool
    var premium: Bool
    var isUpcoming: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case videoId
        case author
        case authorId
        case authorUrl
        case videoThumbnails
        case description
        case viewCount
        case published
        case publishedText
        case lengthSeconds
        case liveNow
        case premium
        case isUpcoming
    }


    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.videoId = try container.decode(String.self, forKey: .videoId)
        self.author = try container.decode(String.self, forKey: .author)
        self.authorId = try container.decode(String.self, forKey: .authorId)
        self.authorUrl = try container.decode(String.self, forKey: .authorUrl)
        self.videoThumbnails = try container.decode([VideoThumbnails].self, forKey: .videoThumbnails)
        self.description = try container.decode(String.self, forKey: .description)
        self.viewCount = try container.decode(Int.self, forKey: .viewCount)
        self.published = try container.decode(Int.self, forKey: .published)
        self.publishedText = try container.decode(String.self, forKey: .publishedText)
        self.lengthSeconds = try container.decode(Int.self, forKey: .lengthSeconds)
        self.liveNow = try container.decode(Bool.self, forKey: .liveNow)
        self.premium = try container.decode(Bool.self, forKey: .premium)
        self.isUpcoming = try container.decode(Bool.self, forKey: .isUpcoming)
        
        
    }
    
}

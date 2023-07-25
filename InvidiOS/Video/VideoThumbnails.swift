//
//  videoThumbnails.swift
//  InvidiOS
//
//  Created by Matt Luke on 5/5/22.
//

import Foundation

struct VideoThumbnails : Decodable, Hashable {
    
    var quality: String
    var url: String
    var width: Int
    var height: Int
    
    enum CodingKeys: String, CodingKey {
        
        case quality
        case url
        case width
        case height
        
    }


    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.quality = try container.decode(String.self, forKey: .quality)
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        
    }
    
}

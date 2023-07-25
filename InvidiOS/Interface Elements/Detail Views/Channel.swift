//
//  Channel.swift
//  InvidiOS
//
//  Created by Matt Luke on 7/3/22.
//

import Foundation

protocol ChannelModelDelegate {
    func resultsFetched(_ channel: Channel)
}

class ChannelModel {
    
    var delegate:ChannelModelDelegate?
    
    func getChannelDetails(channelId: String) {
        
        // Create a URL object
        let url = URL(string: "\(Constants.API_URL)channel/\(channelId)")
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Channel.self, from: data!)
                
                
                
                DispatchQueue.main.async {
                    
                    // Call the "videosFetched" method of the delegate
                    self.delegate?.resultsFetched(response)
                }
                
                
                // dump(response)
            }
            catch {
                print(error)
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}


struct Channel : Decodable, Hashable {
    
    var author: String
    var authorId: String
    var authorUrl: String
    var authorBanners: [AuthorImages]
    var subCount: Int
    var description: String
    var latestVideos: [VideoResult]
    var relatedChannels: [RelatedChannel]
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case author
        case authorId
        case authorUrl
        case authorBanners
        case subCount
        case description
        case latestVideos
        case relatedChannels
    }
    
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.author = try container.decode(String.self, forKey: .author)
        self.authorId = try container.decode(String.self, forKey: .authorId)
        self.authorUrl = try container.decode(String.self, forKey: .authorUrl)
        self.authorBanners = try container.decode([AuthorImages].self, forKey: .authorBanners)
        self.subCount = try container.decode(Int.self, forKey: .subCount)
        self.description = try container.decode(String.self, forKey: .description)
        self.latestVideos = try container.decode([VideoResult].self, forKey: .latestVideos)
        self.relatedChannels = try container.decode([RelatedChannel].self, forKey: .relatedChannels)
        
        
    }
    
}

struct RelatedChannel : Decodable, Hashable {
    
    var author: String
    var authorId: String
    var authorUrl: String
    var authorThumbnails: [AuthorImages]
    
    enum CodingKeys: String, CodingKey {
        
        case author
        case authorId
        case authorUrl
        case authorThumbnails
        
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.author = try container.decode(String.self, forKey: .author)
        self.authorId = try container.decode(String.self, forKey: .authorId)
        self.authorUrl = try container.decode(String.self, forKey: .authorUrl)
        self.authorThumbnails = try container.decode([AuthorImages].self, forKey: .authorThumbnails)
        
    }
    
}

struct AuthorImages : Decodable, Hashable {
    
    var url: String
    var width: Int
    var height: Int
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        
    }
    
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        
    }
    
}

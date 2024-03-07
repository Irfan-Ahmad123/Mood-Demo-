//
//  FriendsFeed.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-07.
//

import Foundation

struct FriendsFeedModal: Codable {
    let friendsfeed: FriendsFeeds
    
    enum CodingKeys: String, CodingKey {
        case friendsfeed = "friend_feeds"
    }
}

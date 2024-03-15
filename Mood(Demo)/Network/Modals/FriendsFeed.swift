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

struct FriendsFeeds: Codable {
    let currentPage: Int
    let data: [Friend]
    let firstPageUrl: String
    let from: Int
    let lastPage: Int
    let lastPageUrl: String
    let nextPageUrl: String?
    let path: String
    let perPage: Int
    let prevPageUrl: String?
    let to: Int
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageUrl = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageUrl = "last_page_url"
        case nextPageUrl = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageUrl = "prev_page_url"
        case to
        case total
    }
}

struct Friend: Codable {
    var activityTitle: String?
    var activityDescription: String?
    var activityAddress: String?
    var createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case activityTitle = "activity_title"
        case activityDescription = "activity_description"
        case activityAddress = "activity_address"
        case createdAt = "created_at"
    }
}

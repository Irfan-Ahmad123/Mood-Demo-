//
//  DiscoverFeed.swift
//  Mood(Demo)
//
//  Created by Zain on 2024-03-11.
//

import Foundation

struct DiscoverModel: Codable {
    let discoverFeeds: DiscoverFeed

    enum CodingKeys: String, CodingKey {
        case discoverFeeds = "discover_feeds"
    }
}

struct DiscoverFeed: Codable {
    let currentPage: Int
    let data: [Discover]
    let firstPageUrl: String
    let from: Int
    let lastPage: Int
    let lastPageUrl: String
    var nextPageUrl: String?
    let path: String
    let perPage: Int
    var prevPageUrl: String?
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

struct Discover: Codable {
    let id: Int?
    let activityTitle: String?
    let activityAddress: String?
    let activityPicture: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case activityTitle = "activity_title"
        case activityAddress = "activity_address"
        case activityPicture = "activity_picture"
        case createdAt = "created_at"
    }
}

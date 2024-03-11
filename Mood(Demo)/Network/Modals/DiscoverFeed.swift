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

//
//  DataSource-Friends.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-04.
//

import UIKit

struct Data
{
    var profileImage:   String
    var userName:       String
    var time:           String
    var event:          String
    var mainimg:        String
    var likes:          String
    var comments:       String

}
struct FriendsFeeds: Codable {
    
    let current_page:    Int
    let data:            [Friend]
    let first_page_url:  String
    let from :           Int
    let last_page:       Int
    let last_page_url:   String
    let next_page_url:   String?
    let path:            String
    let per_page:        Int
    let prev_page_url:   String?
    let to:              Int
    let total:           Int

}

struct Friend: Codable {
    var activity_title: String?
    var activity_description: String?
    var activity_address: String?
    var created_at: String?
}

//
//  File.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//


import UIKit

struct TabelData
{
    var profileImage: String
    var userName: String
    var date: String
    var time : String
    var address : String
    var event :String
    var btnTitle : String

}

struct DiscoverFeed: Codable {
    let current_page: Int
    let data: [Discover]
    let first_page_url: String
    let from: Int
    let last_page: Int
    let last_page_url: String
    var next_page_url: String?
    let path: String
    let per_page: Int
    var prev_page_url: String?
    let to: Int
    let total: Int
}

struct Discover: Codable {
    var id: Int?
    var activity_title: String?
    var activity_address: String?
    var activity_picture: String?
    var created_at: String?
}


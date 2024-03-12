//
//  Network-Management.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-07.
//

import Foundation

class NetworkManager{
    
    static func callingAPI(completion: @escaping(FriendsFeedModal?, Error?) -> Void){
        guard let url = URL(string: FriendsFeedUrl) else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let FriendFeedResponse = try decoder.decode(FriendsFeedModal.self, from: data)
                completion(FriendFeedResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    static func callingAPIForDiscover(completion: @escaping(DiscoverModel?, Error?) -> Void){
        guard let url = URL(string: Discover_url) else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(tokenDiscover)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            //            var stringData = String(data: data, encoding: .utf8)
            //            print(stringData)
            do {
                let decoder = JSONDecoder()
                let discoverResponse = try decoder.decode(DiscoverModel.self, from: data)
                //                let firstDiscoverId = discoverResponse.discoverFeeds.data.first?.id
                //                let firstDiscoverTitle = discoverResponse.discoverFeeds.data.first?.activity_title
                //                let firstDiscoverAddress = discoverResponse.discoverFeeds.data.first?.activity_address
                //                print("First Discover ID: \(firstDiscoverId)")
                //                print("First Discover ID: \(firstDiscoverTitle)")
                //                print("First Discover ID: \(firstDiscoverAddress)")
                
                completion(discoverResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func registerUser(registerModel: userSignUpInfo, completion: @escaping (Error?) -> Void) {
            // Create URL from register_url string
        guard let url = URL(string: register_url) else {
            completion(APIError.invalidURL)
            return
        }
        
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set HTTP header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Convert RegisterModel to JSON data
        guard let jsonData = try? JSONEncoder().encode(registerModel) else {
            completion(APIError.encodingFailed)
            return
        }
        
        // Set HTTP body with JSON data
        request.httpBody = jsonData
        
        // Create URLSessionDataTask
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(error)
                return
            }
            
            // Check HTTP status code
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(APIError.invalidResponse)
                return
            }
            
            // Handle successful response (optional)
            
            // Call completion handler with nil error
            completion(nil)
        }
        
        // Start URLSessionDataTask
        task.resume()
    }
    func loginUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: login_url) else {
            completion(APIError.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let loginData: [String: String] = ["email": email, "password": password]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: loginData) else {
            completion(APIError.encodingFailed)
            return
        }
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(APIError.invalidResponse)
                return
            }
            
            completion(nil)
        }
        
        task.resume()
    }

}

    // Define custom APIError enum
enum APIError: Error {
    case invalidURL
    case encodingFailed
    case invalidResponse
}


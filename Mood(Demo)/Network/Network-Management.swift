//
//  Network-Management.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-07.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    
    func callingAPI(withToken token: String, completion: @escaping(FriendsFeedModal?, Error?) -> Void){
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
                let friendFeedResponse = try decoder.decode(FriendsFeedModal.self, from: data)
                completion(friendFeedResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func callingAPIForDiscover(withToken token: String, completion: @escaping(DiscoverModel?, Error?) -> Void){
        guard let url = URL(string: Discover_url) else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
                let discoverResponse = try decoder.decode(DiscoverModel.self, from: data)
                completion(discoverResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func registerUser(registerModel: userSignUpInfo, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: register_url) else {
            completion(APIError.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let jsonData = try? JSONEncoder().encode(registerModel) else {
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
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: []),
               let token = (json as? [String: Any])?["token"] as? String {
                UserDefaults.standard.set(token, forKey: "userToken")
            } else {
                completion(APIError.tokenNotFound)
                return
            }
            completion(nil)
        }
        task.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case encodingFailed
    case invalidResponse
    case tokenNotFound
}


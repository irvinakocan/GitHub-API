//
//  Request.swift
//  GitHub API networking
//
//  Created by Macbook Air 2017 on 9. 12. 2023..
//

import Foundation

enum MyError: Error {
    case BAD_URL
    case INVALID_RESPONSE
    case INVALID_DECODING
}

class Request {
    static func getUser() async throws -> GitHubUser {
        
        guard let url = URL(string: GITHUB_URL + GET_USER_ENDPOINT + USERNAMES[1]) else {
            throw MyError.BAD_URL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MyError.INVALID_RESPONSE
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        }
        catch {
            throw MyError.INVALID_DECODING
        }
    }
    
    static func getImageData(imageUrlString: String) async -> Data? {
        
        guard let url = URL(string: imageUrlString) else {
            return nil
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        }
        catch {
            return nil
        }
    }
}

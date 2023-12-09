//
//  Models.swift
//  GitHub API networking
//
//  Created by Macbook Air 2017 on 9. 12. 2023..
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String?
}

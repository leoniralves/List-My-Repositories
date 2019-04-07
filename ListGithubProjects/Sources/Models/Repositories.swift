//
//  Repositories.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 07/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation

struct Repositories {
    let repos: [Repository]
}

extension Repositories: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        repos = try container.decode([Repository].self)
    }
}

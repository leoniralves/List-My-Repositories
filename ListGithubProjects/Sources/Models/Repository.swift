//
//  Repository.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation

struct Repository: Decodable, Repositoreable {
    var id: Int
    var name: String
    var fork: Bool
}

//
//  Repositoreable.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation

protocol Repositoreable {
    var id: Int { get }
    var name: String { get }
    var fork: Bool { get }
}

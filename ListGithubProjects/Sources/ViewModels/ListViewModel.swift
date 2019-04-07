//
//  ListViewModel.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 07/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation
import NetworkKit

class ListViewModel {
    
    func loadData(completion: @escaping ((_ repositories: [Repository])->Void)) {
        NetworkKit.request(.repos, method: .GET) { (response) in
            switch response {
            case .success(let paramenter):
                do {
                    let jsonDecoder = JSONDecoder()
                    let decoder = try jsonDecoder.decode(Repositories.self, from: paramenter)
                    completion(decoder.repos)
                } catch {
                    print(error)
                }
            case .error(let error):
                print(error)
            }
        }
    }
}

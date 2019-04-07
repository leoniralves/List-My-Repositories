//
//  Network.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation

class Network {
    
    enum Endpoints {
        case repos
        
        var url: URL? {
            switch self {
            case .repos:
                return URL(string: "https://api.github.com/users/leoniralves/repos")
            }
        }
    }
    
    enum Methods {
        case POST
        case GET
    }
    
    enum Response {
        case success(Data)
        case error(Error)
    }
    
    class func request(_ endpoint: Endpoints, method: Methods, completionHandler: @escaping ((Response)->Void)) {
        guard let url = endpoint.url else {
            fatalError("URL Not Found!")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, _, error) in
            if let _error = error {
                completionHandler(Response.error(_error))
            }
            
            guard let _data = data else {
                completionHandler(Response.error(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data Not Found!"])))
                return
            }
            
            completionHandler(Response.success(_data))
        }
        
        task.resume()
    }
}

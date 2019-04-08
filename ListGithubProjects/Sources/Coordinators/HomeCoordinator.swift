//
//  HomeCoordinator.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 02/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit
import ListKit
import CoreKit

class HomeCoordinator: Coordinatable {
    
    private let presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        guard let presenter = self.presenter else {
            fatalError()
        }
        
        let homeController = HomeController()
        homeController.delegate = self
        presenter.show(homeController, sender: nil)
    }
}

extension HomeCoordinator: HomeDelegate {
    
    func showList(homeController: HomeController) {
        guard let presenter = self.presenter else {
            fatalError()
        }
        
        ListKit.instantiateReposList(presenter: presenter)
    }
}

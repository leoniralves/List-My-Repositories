//
//  ListCoordinator.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 02/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinatable {
    
    private let presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        guard let presenter = self.presenter else {
            fatalError()
        }
        
        let viewModel = ListViewModel()
        let listController = ListController(viewModel: viewModel)
        presenter.show(listController, sender: nil)
    }
}

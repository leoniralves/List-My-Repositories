//
//  ListController.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 02/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class ListController: UIViewController {

    private var viewModel: ListViewModel?
    private var listView = ListView()
    
    init(viewModel: ListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.loadData(completion: { (repos) in
            self.listView.configure(repositories: repos)
        })
    }
}

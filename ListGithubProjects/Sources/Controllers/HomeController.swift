//
//  ViewController.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 02/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    private var homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    weak var delegate: HomeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.showListCallback = {
            self.delegate?.showList(homeController: self)
        }
    }
    
}


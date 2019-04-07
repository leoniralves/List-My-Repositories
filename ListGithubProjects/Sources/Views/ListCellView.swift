//
//  ListCellView.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class ListCellView: UITableViewCell {
    
    func configure(repository: Repositoreable) {
        setupViews(repository: repository)
    }
    
    private func setupViews(repository: Repositoreable) {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        let lbName = UILabel()
        lbName.text = repository.name
        stackView.addArrangedSubview(lbName)
        
        if repository.fork {
            let icon = UIImage(named: "icons8-divisao-de-codigo-24")
            let ivIcon = UIImageView(image: icon)
            stackView.addArrangedSubview(ivIcon)
        }
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

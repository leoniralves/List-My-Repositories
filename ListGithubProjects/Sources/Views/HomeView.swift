//
//  HomeView.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    var showListCallback: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawButtonActionShowList()
    }
    
    private func drawButtonActionShowList() {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        btn.setTitle("Show List", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnShowListCliked), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc private func btnShowListCliked() {
        showListCallback?()
    }
}

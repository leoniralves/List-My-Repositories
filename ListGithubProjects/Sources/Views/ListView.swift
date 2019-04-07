//
//  ListView.swift
//  ListGithubProjects
//
//  Created by Leonir Alves Deolindo on 06/04/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    private var tableView: UITableView!
    private var listRepositories: [Repositoreable] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCellView.self, forCellReuseIdentifier: "listCell")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addTableView()
    }
    
    func configure(repositories: [Repositoreable]) {
        listRepositories = repositories
        DispatchQueue.main.sync {
            self.tableView.reloadData()
        }
    }
    
    private func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension ListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listRepositories.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListCellView else {
            return UITableViewCell()
        }
        
        cell.configure(repository: listRepositories[indexPath.row])
        return cell
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  NFTDetailScreen.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 30/09/23.
//

import UIKit

class NFTDetailScreen: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NFTImageTableViewCell.self, forCellReuseIdentifier: NFTImageTableViewCell.identifier)
        table.register(NFTDescriptionTableViewCell.self, forCellReuseIdentifier: NFTDescriptionTableViewCell.identifier)
        table.register(LatestDealTableViewCell.self, forCellReuseIdentifier: LatestDealTableViewCell.identifier)
        table.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        table.separatorStyle = .none
        return table
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    private func addViews() {
      addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

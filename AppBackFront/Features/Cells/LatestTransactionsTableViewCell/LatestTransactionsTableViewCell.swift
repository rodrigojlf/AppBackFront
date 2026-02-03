//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 17/10/23.
//

import UIKit

class LatestTransactionsTableViewCell: UITableViewCell {

    static let identifier = String(describing: LatestTransactionsTableViewCell.self)
    var viewModel = LatestTransactionsTableViewCellViewModel()
    
    private lazy var screen: LatestTransactionsTableViewCellScreen = {
        let view = LatestTransactionsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        configConstraints()
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: LatestTransactionsCell) {
        viewModel.setLatestTransactions(data: data)
        screen.titleLabel.text = viewModel.title
    }

}

extension LatestTransactionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionsTableViewCell.identifier, for: indexPath) as? ListOfTransactionsTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentLatestDeal(indexPath: indexPath), isInitial: viewModel.isInitial(indexPath: indexPath), isFinal: viewModel.isFinal(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }

}

//
//  NFTDetailVC.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 30/09/23.
//

import UIKit

enum NameCellNFTDetailVC: Int {
    case nftImage = 0
    case description = 1
    case latestDeal = 2
}

class NFTDetailVC: UIViewController {
    
    private var screen: NFTDetailScreen?
    private let viewModel: NFTDetailViewModel
    
    required init(nft: Nft) {
        viewModel = NFTDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = NFTDetailScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension NFTDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch NameCellNFTDetailVC(rawValue: indexPath.row) {
            
        case .nftImage: //indexPath.row == 0
            let cell = tableView.dequeueReusableCell(withIdentifier: NFTImageTableViewCell.identifier, for: indexPath) as? NFTImageTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
            
        case .description: //indexPath.row == 1
            let cell = tableView.dequeueReusableCell(withIdentifier: NFTDescriptionTableViewCell.identifier, for: indexPath) as? NFTDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNFT, title: viewModel.titleNFT, description: viewModel.descriptionNFT)
            return cell ?? UITableViewCell()
            
        case .latestDeal: //indexPath.row == 2
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell
            cell?.setupCell(data: viewModel.getNFT)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath, width: view.frame.width)
    }
}

extension NFTDetailVC: NFTImageTableViewCellScreenDelegate {
    
    func tappedClosedButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyGlassButton() {
        present(MagnifyGlassVC(urlImage: viewModel.nftImage), animated: true)
    }
    
}
